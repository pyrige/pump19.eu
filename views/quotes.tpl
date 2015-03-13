% rebase("base.tpl", subtitle=subtitle, active="quotes")
<h1>
  Quotes
  <span class="pull-right btn btn-default">Total <span class="badge">{{count}}</span></span>
</h1>
<nav>
  <ul class="pager">
  % if page > 0:
    <li class="previous">
      <a href="/quotes/{{page-1}}"><i class="fa fa-arrow-left"></i>&nbsp;Newer</a>
    </li>
  % end
  % if page < count//10:
    <li class="next">
      <a href="/quotes/{{page+1}}">Older&nbsp;<i class="fa fa-arrow-right"></i></a>
    </li>
  % end
  </ul>
</nav>
% for quote in quotes:
<blockquote>
  <span class="pull-right badge">#{{quote["qid"]}}</span>
  <p>{{quote["quote"]}}</p>
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
<nav>
  <ul class="pager">
  % if page > 0:
    <li class="previous">
      <a href="/quotes/{{page-1}}"><i class="fa fa-arrow-left"></i>&nbsp;Newer</a>
    </li>
  % end
  % if page < count//10:
    <li class="next">
      <a href="/quotes/{{page+1}}">Older&nbsp;<i class="fa fa-arrow-right"></i></a>
    </li>
  % end
  </ul>
</nav>
