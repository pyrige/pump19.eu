#!/usr/bin/env python3
# vim:fileencoding=utf-8:ts=8:et:sw=4:sts=4:tw=79

"""
routes/misc.py

Miscellaneous routes for the "Pump19 Twitch Chat Golem" bottle application.

Copyright (c) 2015 Twisted Pear <pear at twistedpear dot at>
See the file LICENSE for copying permission.
"""

from bottle import request, template
from json import load as json_loadf
from os import environ
from uuid import uuid4

SCROBBLE_URL = environ["SCROBBLE_URL"]

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


def scrobblrr(db, rdb):
    """Show information on ScrobbLRR and the credentials."""
    session = request.environ.get("beaker.session")
    user_name = session.get("user_name")

    # we can't retrieve credentials without user name
    if not user_name:
        return template("scrobblrr", session=session,
                        subtitle="ScrobbLRR")

    # get current credentials or add new ones
    ckey = "scrobblrr:user:{user}:cred".format(user=user_name)
    cred = rdb.get(ckey)
    if not cred:
        cred = uuid4().hex
        rdb.set(ckey, cred)

    return template("scrobblrr", session=session,
                    subtitle="ScrobbLRR", cred=cred, scrobble_url=SCROBBLE_URL)
