% last_page = nof_pages - 1
% prev_page = page - 1 if page > 0 else None
% next_page = page + 1 if page < last_page else None
<nav class="text-center">
  <ul class="pagination pagination-sm">
  % if prev_page is not None:
    <li>
      <a href="/quotes/{{prev_page}}"><i class="fa fa-arrow-left"></i></a>
    </li>
  % else:
    <li class="disabled"><a href="/quotes/"><i class="fa fa-arrow-left"></i></a></li>
  % end
  % for page_no in range(nof_pages):
    <li{{!" class=\"active\"" if page is page_no else ""}}>
      <a href="/quotes/{{page_no}}">{{page_no}}</a>
    </li>
  % end
  % if next_page is not None:
    <li><a href="/quotes/{{next_page}}"><i class="fa fa-arrow-right"></i></a></li>
  % else:
    <li class="disabled"><a href="/quotes/{{last_page}}"><i class="fa fa-arrow-right"></i></a></li>
  % end
  </ul>
</nav>
