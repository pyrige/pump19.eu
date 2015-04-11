#!/usr/bin/env python3
# vim:fileencoding=utf-8:ts=8:et:sw=4:sts=4:tw=79

"""
application.wsgi

The "Pump19 Twitch Chat Golem" bottle application.

Copyright (c) 2015 Twisted Pear <pear at twistedpear dot at>
See the file LICENSE for copying permission.
"""

from beaker.middleware import SessionMiddleware
from bottle import Bottle, redirect, request, route, template, view
from bottle.ext import sqlalchemy
from functools import partial
from json import load as json_loadf, loads as json_loads
from os import environ
from sqlalchemy import create_engine
from urllib.request import Request, urlopen
from urllib.parse import urlencode
from urllib.error import HTTPError

with open("commands.json") as cmd_fp:
    commands = json_loadf(cmd_fp)

# get settings for Twitch.tv authorization code flow
TWITCH_BASE_URL = "https://api.twitch.tv/kraken"
TWITCH_OAUTH_URL = TWITCH_BASE_URL + "/oauth2/authorize"
TWITCH_TOKEN_URL = TWITCH_BASE_URL + "/oauth2/token"
TWITCH_CLIENT_ID = environ["TWITCH_CLIENT_ID"]
TWITCH_CLIENT_SECRET = environ["TWITCH_CLIENT_SECRET"]
OAUTH_RESPONSE_URL = environ["OAUTH_RESPONSE_URL"]

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


def handle_home():
    """Show the home page."""
    session = request.environ.get("beaker.session")
    return template("home", session=session,
                    subtitle="Home")


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
