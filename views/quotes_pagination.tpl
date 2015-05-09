% last_page = nof_pages - 1
% prev_page = page - 1 if page > 0 else None
% next_page = page + 1 if page < last_page else None
<div class="row">
  <nav class="small-11 small-centered columns pagination-centered">
    <ul class="pagination">
    % if prev_page is not None:
      <li><a href="/quotes/0"><i class="fa fa-angle-double-left"></i></a></li>
      <li><a href="/quotes/{{prev_page}}"><i class="fa fa-angle-left"></i></a></li>
    % end
    % for page_no in range(max(0, page - 2), min(last_page, page + 3)):
      <li{{!" class=\"current\"" if page is page_no else ""}}>
        <a href="/quotes/{{page_no}}">{{page_no}}</a>
      </li>
    % end
    % if next_page is not None:
      <li><a href="/quotes/{{next_page}}"><i class="fa fa-angle-right"></i></a></li>
      <li><a href="/quotes/{{last_page}}"><i class="fa fa-angle-double-right"></i></a></li>
    % end
    </ul>
  </nav>
</div>
