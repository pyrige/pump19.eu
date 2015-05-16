#!/usr/bin/env python3
# vim:fileencoding=utf-8:ts=8:et:sw=4:sts=4:tw=79

"""
routes/__init__.py

Entry point for route handling in the "Pump19 Twitch Chat Golem" bottle
application.

Copyright (c) 2015 Twisted Pear <pear at twistedpear dot at>
See the file LICENSE for copying permission.
"""

import routes.auth
import routes.codefall
import routes.misc
import routes.quotes

__all__ = ["auth", "codefall", "misc", "quotes"]
