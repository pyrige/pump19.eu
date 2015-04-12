#!/usr/bin/env python3
# vim:fileencoding=utf-8:ts=8:et:sw=4:sts=4:tw=79

"""
application.wsgi

The "Pump19 Twitch Chat Golem" bottle application.

Copyright (c) 2015 Twisted Pear <pear at twistedpear dot at>
See the file LICENSE for copying permission.
"""

from Crypto.Cipher import ARC2
from beaker.middleware import SessionMiddleware
from bottle import Bottle, redirect, request, route, template, view
from bottle.ext import sqlalchemy
from functools import partial
from json import load as json_loadf, loads as json_loads
from os import environ
from sqlalchemy import create_engine
from sqlalchemy.exc import IntegrityError
from urllib.error import HTTPError
from urllib.parse import urlencode, urljoin
from urllib.request import Request, urlopen

with open("commands.json") as cmd_fp:
    commands = json_loadf(cmd_fp)

# get settings for Twitch.tv authorization code flow
TWITCH_BASE_URL = "https://api.twitch.tv/kraken"
TWITCH_OAUTH_URL = TWITCH_BASE_URL + "/oauth2/authorize"
TWITCH_TOKEN_URL = TWITCH_BASE_URL + "/oauth2/token"
TWITCH_CLIENT_ID = environ["TWITCH_CLIENT_ID"]
TWITCH_CLIENT_SECRET = environ["TWITCH_CLIENT_SECRET"]
OAUTH_RESPONSE_URL = environ["OAUTH_RESPONSE_URL"]

CODEFALL_CIPHER = ARC2.new(environ["CODEFALL_SECRET"], ARC2.MODE_ECB)
CODEFALL_URL_BASE = environ["CODEFALL_URL_BASE"]

app = Bottle()
engine = create_engine(environ["DATABASE_URL"])
sa_plugin = sqlalchemy.Plugin(engine, commit=False)
app.install(sa_plugin)

session_opts = {
    "session.type": "file",
    "session.data_dir": environ["SESSION_DATA_DIR"],
    "session.url": environ["DATABASE_URL"],
    "session.cookie_domain": environ["SESSION_COOKIE_DOMAIN"],
    "session.secret": environ["SESSION_SECRET"]
}
application = SessionMiddleware(app, session_opts)


def int_to_codefall_key(value):
    raw = value.to_bytes(ARC2.block_size, byteorder="big")
    msg = CODEFALL_CIPHER.encrypt(raw)
    return int.from_bytes(msg, byteorder="big")


def codefall_key_to_int(value):
    msg = value.to_bytes(ARC2.block_size, byteorder="big")
    raw = CODEFALL_CIPHER.decrypt(msg)
    return int.from_bytes(raw, byteorder="big")


def handle_home():
    """Show the home page."""
    session = request.environ.get("beaker.session")
    return template("home", session=session,
                    subtitle="Home")


def handle_codefall(db):
    """Show a list of all codefall pages and a form to add new ones."""
    session = request.environ.get("beaker.session")
    user_name = session.get("user_name")

    # we can't retrieve keys without user name
    if not user_name:
        return template("codefall", session=session,
                        subtitle="Codefall")

    # get all codes for the user from the database
    codes_qry = """SELECT cid, description, code, code_type, claimed
                   FROM codefall
                   WHERE user_name = :user_name"""
    codes = db.execute(codes_qry, {"user_name": user_name})

    unclaimed, claimed = list(), list()
    for code in codes:
        entry = {"description": code.description,
                 "code_type": code.code_type}

        if not code.claimed:
            # for unclaimed codes we need to generate our "random" link
            secret = int_to_codefall_key(code.cid)
            secret_url = CODEFALL_URL_BASE.format(secret=secret)
            entry["secret_url"] = secret_url
            unclaimed.append(entry)
        else:
            claimed.append(entry)

    return template("codefall", session=session,
                    subtitle="Codefall",
                    unclaimed=unclaimed, claimed=claimed)


def handle_codefall_add(db):
    """Add a new codefall page."""
    session = request.environ.get("beaker.session")
    # we require users to be logged in when adding new codes
    if not session.get("logged_in", False):
        redirect("/codefall")

    # get all mandatory items
    user_name = session.get("user_name")
    description = request.forms.get("description")
    code = request.forms.get("code")
    code_type = request.forms.get("code_type")
    if not all((user_name, description, code, code_type)):
        redirect("/codefall")

    new_code_qry = """INSERT INTO codefall (description,
                                            code,
                                            code_type,
                                            user_name)
                      VALUES (:description,:code, :code_type, :user_name)"""
    try:
        db.execute(new_code_qry,
                   {"description": description,
                    "code": code,
                    "code_type": code_type,
                    "user_name": user_name})
    except IntegrityError:
        redirect("/codefall")

    # everything seems fine, store the data now
    db.commit()

    # now redirect back to codefall page
    redirect("/codefall")


def handle_codefall_claim(secret, db):
    """Claim a codefall page."""
    session = request.environ.get("beaker.session")

    # first, try to parse the secret
    try:
        cid = codefall_key_to_int(secret)
    except:
        return template("codefall_claim", session=session,
                        subtitle="Codefall")

    claim_code_qry = """UPDATE codefall
                        SET claimed = True
                        WHERE
                            cid = :cid
                            AND
                            claimed = False
                        RETURNING description, code, code_type"""

    code = db.execute(claim_code_qry, {"cid": cid})
    db.commit()
    code = code.first()
    if not code:
        return template("codefall_claim", session=session,
                        subtitle="Codefall")

    entry = {"description": code.description,
             "code": code.code,
             "code_type": code.code_type}

    return template("codefall_claim", session=session,
                    subtitle="Codefall", entry=entry)


def handle_commands():
    """Show a list of supported commands."""
    session = request.environ.get("beaker.session")
    return template("commands", session=session,
                    subtitle="Commands", commands=commands)


def handle_login():
    """Show the login page and create a new session."""
    session = request.environ.get("beaker.session")
    session.save()

    return template("login", session=session,
                    subtitle="Login",
                    twitch_oauth_url=TWITCH_OAUTH_URL,
                    twitch_client_id=TWITCH_CLIENT_ID,
                    oauth_response_url=OAUTH_RESPONSE_URL)


def handle_oauth():
    """
    Handle the answer from Twitch and request an oauth token.
    Store both the token and the user name in the session.
    """
    session = request.environ.get("beaker.session")
    # make sure we get both state and code and the response is for this session
    state = request.query.get("state")
    code = request.query.get("code")
    if not state or not code or session.id != state:
        redirect("/logout")

    # now we need to get an access token
    token_opts = {
        "client_id": TWITCH_CLIENT_ID,
        "client_secret": TWITCH_CLIENT_SECRET,
        "grant_type": "authorization_code",
        "redirect_uri": OAUTH_RESPONSE_URL,
        "code": code
    }
    token_data = urlencode(token_opts).encode()
    token_request = Request(TWITCH_TOKEN_URL, data=token_data)
    try:
        response = urlopen(token_request, timeout=5)
        raw_data = response.read()
    except HTTPError:
        redirect("/logout")

    token_data = json_loads(raw_data.decode(errors="replace"))

    # make sure we got our token
    if "access_token" not in token_data:
        redirect("/logout")

    # store the token in our session
    token = token_data["access_token"]
    session["oauth_token"] = token

    # now get the user name as well
    user_headers = {"Authorization": "OAuth {0}".format(token)}
    user_request = Request(TWITCH_BASE_URL, headers=user_headers)
    try:
        response = urlopen(user_request, timeout=5)
        raw_data = response.read()
    except HTTPError:
        redirect("/logout")

    user_data = json_loads(raw_data.decode(errors="replace"))
    # make sure we got our token
    if "token" not in user_data or "user_name" not in user_data["token"]:
        redirect("/logout")

    # store user name in our session
    user_name = user_data["token"]["user_name"]
    session["user_name"] = user_name
    session["logged_in"] = True
    session.save()

    redirect("/login")


def handle_logout():
    """Clear a user's session."""
    session = request.environ.get("beaker.session")
    session.delete()
    redirect("/login")


def handle_quotes(page, db):
    """Show a paginated portion of all known quotes."""
    session = request.environ.get("beaker.session")

    nof_quotes = db.execute("""SELECT COUNT(*)
                               FROM quotes
                               WHERE deleted = FALSE""").scalar()
    nof_pages, remainder = divmod(nof_quotes, 10)
    if remainder:
        nof_pages += 1

    page = max(page, 0)
    page = min(page, nof_pages - 1)

    offset = 10 * page
    quotes = db.execute("""SELECT qid,
                                  quote,
                                  attrib_name AS name,
                                  attrib_date as date
                           FROM quotes
                           WHERE deleted = FALSE
                           ORDER BY qid DESC
                           LIMIT 10
                           OFFSET {offset}""".format(offset=offset))
    quotes = [dict(row) for row in quotes.fetchall()]
    return template("quotes", session=session,
                    subtitle="Quotes", quotes=quotes, page=page,
                    nof_quotes=nof_quotes, nof_pages=nof_pages)

app.route("/", "GET", handle_home)
app.route("/codefall", "GET", handle_codefall)
app.route("/codefall/add", "POST", handle_codefall_add)
app.route("/codefall/<secret:int>", "GET", handle_codefall_claim)
app.route("/commands", "GET", handle_commands)
app.route("/login", "GET", handle_login)
app.route("/oauth", "GET", handle_oauth)
app.route("/logout", "GET", handle_logout)
app.route("/quotes/", "GET", partial(handle_quotes, 0))
app.route("/quotes/<page:int>", "GET", handle_quotes)

if __name__ == "__main__":
    # we start a local dev server when this file is executed as a script
    # add a route for static files
    from bottle import static_file, run

    @app.route("/static/<filepath:path>")
    def serve_static(filepath):
        return static_file(filepath, "./static")

    run(app=application,
        host="dev.pump19.eu", port=8080,
        reloader=True, debug=True)
