% rebase("base.tpl", active="codefall")
<main class="row align-center">
% if defined("entry"):
  <section class="small-11 column">
    <h1>
      <i class="fa fa-gift"></i>
      Claimed Code
    </h1>
    <p>
      Congratulations, you just claimed the following entry:
    </p>
  </section>
  <section class="small-11 column">
    <div class="callout panel text-center">
      <h1>
        <i class="fa fa-gamepad"></i>
        {{entry["description"]}}
        <small>{{entry["code_type"]}}</small>
      </h1>
      <h2>
        <code>{{entry["code"]}}</code>
      </h2>
    </div>
  </section>
% else:
  <section class="small-11 column">
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
</main>
