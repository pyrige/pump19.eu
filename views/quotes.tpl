% rebase("base.tpl", subtitle=subtitle, active="quotes")
<h1>
  Quotes
  <span class="pull-right btn btn-default">Total <span class="badge">{{nof_quotes}}</span></span>
</h1>
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
