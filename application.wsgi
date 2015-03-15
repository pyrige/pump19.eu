#!/usr/bin/env python3
# vim:fileencoding=utf-8:ts=8:et:sw=4:sts=4:tw=79

"""
application.wsgi

The "Pump19 Twitch Chat Golem" bottle application.

Copyright (c) 2015 Twisted Pear <pear at twistedpear dot at>
See the file LICENSE for copying permission.
"""

from bottle import Bottle, route, template
from bottle.ext import sqlalchemy
from functools import partial
from json import load as load_json
from os import environ
from sqlalchemy import create_engine

with open("commands.json") as cmd_fp:
    commands = load_json(cmd_fp)

app = application = Bottle()
engine = create_engine(environ["DATABASE_URL"])
sa_plugin = sqlalchemy.Plugin(engine, commit=False)
app.install(sa_plugin)

def handle_home():
    return template("home", subtitle="Home")

def handle_commands():
    return template("commands", subtitle="Commands", commands=commands)

def handle_quotes(page, db):
    nof_quotes = db.execute("""SELECT COUNT(*)
                               FROM quotes
                               WHERE deleted = FALSE""").scalar()
    page = max(page, 0)
    page = min(page, nof_quotes // 10)

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
    return template("quotes",
            subtitle="Quotes", quotes=quotes, page=page, count=nof_quotes)

app.route("/", "GET", handle_home)
app.route("/commands", "GET", handle_commands)
app.route("/quotes/", "GET", partial(handle_quotes, 0))
app.route("/quotes/<page:int>", "GET", handle_quotes)

if __name__ == "__main__":
    # we start a local dev server when this file is executed as a script
    # add a route for static files
    from bottle import static_file, run
    @app.route("/static/<filepath:path>")
    def serve_static(filepath):
        return static_file(filepath, "./static")

    run(app=app, host="localhost", port=8080, reloader=True, debug=True)
