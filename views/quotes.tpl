% rebase("base.tpl", active="quotes")
<div class="row">
  <div class="small-12 columns">
    <h1><i class="fa fa-comment-o"></i>&nbsp;Quotes</h1>
  </div>
</div>
<div class="row">
  <div class="small-12 columns">
    <div data-alert class="secondary radius alert-box">
      <span class="label warning"><i class="fa fa-exclamation-triangle"></i>&nbsp;Disclaimer</span>
      Please keep in mind that many of the following quotes are taken <strong>out of context</strong>, be it for comedic effect or out of necessity.
      Take all of them with a grain of salt and bear in mind they don't necessarily reflect their originators' views and opinions.
      That being said, if you find any quote to be particularly awful, please notify the moderator of your choice to have its removal evaluated.
      <a href="#" class="close"><i class="fa fa-times"></i></a>
    </div>
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
% include("quotes_pagination", page=page, nof_pages=nof_pages)
