#!/usr/bin/env python3
# vim:fileencoding=utf-8:ts=8:et:sw=4:sts=4:tw=79

"""
routes/bingo.py

Trope Bingo routes for the "Pump19 Twitch Chat Golem" bottle application.

Copyright (c) 2018 Twisted Pear <tp at pump19 dot eu>
See the file LICENSE for copying permission.
"""

from bottle import abort, request, template
from json import load as json_loadf
from random import sample

with open("tropes.json") as tropes_fp:
    tropes = json_loadf(tropes_fp)


def main():
    """Provide a selection of Trope Bingo cards."""
    session = request.environ.get("beaker.session")
    return template("bingo", session=session,
                    subtitle="Trope Bingo")


def show(show):
    """Return a random selection of tropes for the given show."""
    try:
        show_tropes = tropes[show]
        random_tropes = sample(show_tropes, 24)
    except KeyError:
        abort(404, "Show Not Found")

    return template("bingo_card", tropes=random_tropes)
