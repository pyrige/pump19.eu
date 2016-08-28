#!/usr/bin/env python3
# vim:fileencoding=utf-8:ts=8:et:sw=4:sts=4:tw=79

"""
routes/misc.py

Miscellaneous routes for the "Pump19 Twitch Chat Golem" bottle application.

Copyright (c) 2016 Twisted Pear <tp at pump19 dot eu>
See the file LICENSE for copying permission.
"""

from bottle import request, template
from json import load as json_loadf

with open("commands.json") as cmd_fp:
    cmd_dict = json_loadf(cmd_fp)


def home():
    """Show the home page."""
    session = request.environ.get("beaker.session")
    return template("home", session=session,
                    subtitle="Home")


def commands():
    """Show a list of supported commands."""
    session = request.environ.get("beaker.session")
    return template("commands", session=session,
                    subtitle="Commands", commands=cmd_dict)


def contribute():
    """Show contribution page (links to repositories, issue trackers etc)."""
    session = request.environ.get("beaker.session")
    return template("contribute", session=session,
                    subtitle="Contribute")
