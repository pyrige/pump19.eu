% rebase("base.tpl", subtitle=subtitle, active="quotes")
% prev_page = page - 1 if page > 0 else None
% next_page = page + 1 if page < count//10 else None
<h1>
  Quotes
  <span class="pull-right btn btn-default">Total <span class="badge">{{count}}</span></span>
</h1>
<nav>
  <ul class="pager">
  % if prev_page:
    <li class="previous">
      <a href="/quotes/{{prev_page}}"><i class="fa fa-arrow-left"></i>&nbsp;Newer</a>
    </li>
  % else:
    <li class="previous disabled">
      <a href="#"><i class="fa fa-arrow-left"></i>&nbsp;Newer</a>
    </li>
  % end
  % if next_page:
    <li class="next">
      <a href="/quotes/{{next_page}}">Older&nbsp;<i class="fa fa-arrow-right"></i></a>
    </li>
  % else:
    <li class="next disabled">
      <a href="#">Older&nbsp;<i class="fa fa-arrow-right"></i></a>
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
  % if prev_page:
    <li class="previous">
      <a href="/quotes/{{prev_page}}"><i class="fa fa-arrow-left"></i>&nbsp;Newer</a>
    </li>
  % else:
    <li class="previous disabled">
      <a href="#"><i class="fa fa-arrow-left"></i>&nbsp;Newer</a>
    </li>
  % end
  % if next_page:
    <li class="next">
      <a href="/quotes/{{next_page}}">Older&nbsp;<i class="fa fa-arrow-right"></i></a>
    </li>
  % else:
    <li class="next disabled">
      <a href="#">Older&nbsp;<i class="fa fa-arrow-right"></i></a>
    </li>
  % end
  </ul>
</nav>
