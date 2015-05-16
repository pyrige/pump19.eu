#!/usr/bin/env python3
# vim:fileencoding=utf-8:ts=8:et:sw=4:sts=4:tw=79

"""
routes/quotes.py

Quotations routes for the "Pump19 Twitch Chat Golem" bottle application.

Copyright (c) 2015 Twisted Pear <pear at twistedpear dot at>
See the file LICENSE for copying permission.
"""

from bottle import redirect, request, template


def main(page, db):
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


def search(db):
    """Show a search form and available search results (on POST)."""
    session = request.environ.get("beaker.session")

    # on GET just show the search form
    if request.method != "POST":
        return template("quotes_search", session=session,
                        subtitle="Search Quotes")

    # this is POST, search for stuff
    keyword = request.forms.getunicode("keyword")
    scope = request.forms.getunicode("scope", "Q")
    if not keyword or len(keyword) < 3 or scope not in ("Q", "A", "B"):
        redirect("/quotes/search")

    find_quote_qry = """SELECT qid,
                               quote,
                               attrib_name AS name,
                               attrib_date AS date
                        FROM quotes, plainto_tsquery('english', :keyword) Q
                        WHERE
                            deleted = False
                            AND ("""
    if scope in "QB":
        find_quote_qry += "quote @@ Q"
    if scope == "B":
        find_quote_qry += " OR "
    if scope in "AB":
        find_quote_qry += "attrib_name @@ Q"
    find_quote_qry += ") ORDER BY qid DESC"

    quotes = db.execute(find_quote_qry, {"keyword": keyword})

    quotes = [dict(row) for row in quotes.fetchall()]
    return template("quotes_result", session=session,
                    subtitle="Search Result", keyword=keyword, quotes=quotes)
