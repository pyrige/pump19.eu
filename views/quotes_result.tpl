% rebase("base.tpl", active="quotes_search")
<div class="row">
  <div class="small-12 columns">
    <h1><i class="fa fa-search"></i>&nbsp;Search Result</h1>
  </div>
</div>
<div class="row">
  <div class="small-11 small-centered columns clearfix">
    <p>Found <strong>{{len(quotes)}}</strong> matching quotes when searching for <strong>{{keyword}}</strong>.</p>
  </div>
</div>
% for quote in quotes:
<div class="row">
  <blockquote class="small-11 small-centered columns clearfix">
      <p>{{quote["quote"]}}</p>
      <span class="right round info label">#{{quote["qid"]}}</span>
      % if quote["name"] or quote["date"]:
      <cite>
        % if quote["name"]:
          {{quote["name"]}}
        % end
        % if quote["date"]:
          <small>[{{quote["date"]}}]</small>
        % end
      </cite>
      % end
  </blockquote>
</div>
% end
