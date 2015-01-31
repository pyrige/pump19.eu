#!/usr/bin/env python3
# vim:fileencoding=utf-8:ts=8:et:sw=4:sts=4:tw=79

"""
application.wsgi

The "Pump19 Twitch Chat Golem" bottle application.

Copyright (c) 2015 Twisted Pear <pear at twistedpear dot at>
See the file LICENSE for copying permission.
"""

import bottle
import json

with open("commands.json") as cmd_fp:
    commands = json.load(cmd_fp)

app = application = bottle.Bottle()

@app.route("/")
@bottle.view("home")
def handle_commands():
    return {"subtitle": "Home"}

@app.route("/commands/")
@bottle.view("commands")
def handle_commands():
    return {"subtitle": "Commands",
            "commands": commands}

if __name__ == "__main__":
    # we start a local dev server when this file is executed as a script
    # add a route for static files
    @app.route("/static/<filepath:path>")
    def serve_static(filepath):
        return bottle.static_file(filepath, "./static")

    bottle.run(app=app, host="localhost", port=8080,
               reloader=False, debug=True)
