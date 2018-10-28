% rebase("base.tpl", active="codefall")
<article class="grid-x grid-margin-x align-center">
% if defined("entry"):
  <section class="small-11 cell">
    <h1>
      <i class="fa fa-gift"></i>
      Claim Code
    </h1>
    <p>
      You're just one step away from claiming the following code:
    </p>
  </section>
  <section class="small-10 cell">
    <form id="captcha-form" action="{{entry["claim_url"]}}" method="POST" accept-charset="utf-8">
      <div class="callout panel text-center">
        <h1>
          <i class="fa fa-gamepad"></i>
          {{entry["description"]}}
          <small>{{entry["code_type"]}}</small>
        </h1>
        <div id="captcha" style="display: inline-block;"></div>
      </div>
    </form>
  </section>
% else:
  <section class="small-11 cell">
    <h1>
      <i class="fa fa-frown-o"></i>
      Already Claimed
    </h1>
    <p>
      Sorry, the code you were trying to view is already claimed by someone else.
      Better luck next time!
    </p>
  </section>
% end
</article>
