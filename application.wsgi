#!/usr/bin/env python3
# vim:fileencoding=utf-8:ts=8:et:sw=4:sts=4:tw=79

"""
application.wsgi

The "Pump19 Twitch Chat Golem" bottle application.

Copyright (c) 2016 Twisted Pear <tp at pump19 dot eu>
See the file LICENSE for copying permission.
"""

from beaker.middleware import SessionMiddleware
from bottle import Bottle
from bottle.ext import sqlalchemy
from functools import partial
from os import environ
from sqlalchemy import create_engine

import routes

app = Bottle()

# install plugins
engine = create_engine(environ["DATABASE_URL"])
sa_plugin = sqlalchemy.Plugin(engine, commit=False)
app.install(sa_plugin)

session_opts = {
    "session.type": "file",
    "session.data_dir": environ["SESSION_DATA_DIR"],
    "session.url": environ["DATABASE_URL"],
    "session.cookie_domain": environ["SESSION_COOKIE_DOMAIN"],
    "session.cookie_expires": False,
    "session.secret": environ["SESSION_SECRET"]
}
application = SessionMiddleware(app, session_opts)

# misc routes
app.route("/", "GET", routes.misc.home)
app.route("/commands", "GET", routes.misc.commands)
app.route("/contribute", "GET", routes.misc.contribute)

# bingo routes
app.route("/bingo", "GET", routes.bingo.main)
app.route("/bingo/<show>", "GET", routes.bingo.show)

# codefall routes
app.route("/codefall", "GET", routes.codefall.main)
app.route("/codefall/<secret:int>", "GET", routes.codefall.show)
app.route("/codefall/add", "POST", routes.codefall.add)
app.route("/codefall/claim/<secret:int>", "POST", routes.codefall.claim)

# auth routes
app.route("/login", "GET", routes.auth.login)
app.route("/logout", "GET", routes.auth.logout)
app.route("/oauth", "GET", routes.auth.oauth)


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
