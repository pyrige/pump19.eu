% rebase("base.tpl", subtitle=subtitle, active="quotes")
<h1>
  Quotes
  <span class="pull-right btn btn-default">Total <span class="badge">{{nof_quotes}}</span></span>
</h1>
<div class="well well-sm" style="margin-bottom: 20px;">
  <span class="label label-warning"><i class="fa fa-exclamation-triangle"></i>&nbsp;Disclaimer</span>
  <small>
  Please keep in mind that many of the following quotes are taken <strong>out of context</strong>, be it for comedic effect or out of necessity.
  Take all of them with a grain of salt and bear in mind they don't necessarily reflect their originators' views and opinions.
  That being said, if you find any quote to be particularly awful, please notify the moderator of your choice to have its removal evaluated.
  </small>
</div>
% for quote in quotes:
<blockquote class="clearfix">
  <p>{{quote["quote"]}}</p>
  <span class="pull-right badge">#{{quote["qid"]}}</span>
  % if quote["name"] or quote["date"]:
  <small>
    % if quote["name"]:
      {{quote["name"]}}
    % end
    % if quote["date"]:
      <span class="label label-default">{{quote["date"]}}</span>
    % end
  </small>
  % end
</blockquote>
% end
% include("quotes_pagination", page=page, nof_pages=nof_pages)
