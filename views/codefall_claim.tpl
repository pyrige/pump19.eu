% rebase("base.tpl", active="codefall")
<section class="hero is-medium is-dark">
  <div class="hero-body">
    <div class="content container has-text-centered">
% if defined("entry"):
      <h1>
        <span class="icon"><i class="mdi mdi-gift"></i></span>
        Claimed Code
      </h1>
      <p>
        Congratulations, you just claimed the following entry:
      </p>
      <div class="columns is-centered">
        <div class="column is-narrow">
          <div class="message is-large">
            <div class="message-body">
              <h3 class="title">
                <span class="icon"><i class="mdi mdi-gamepad"></i></span>
                {{entry["description"]}}
              </h3>
              <h4 class="subtitle">
                {{entry["code_type"]}}
              </h4>
              <h3>
                <code>{{entry["code"]}}</code>
              </h3>
            </div>
          </div>
        </div>
      </div>
% else:
      <h1>
        <span class="icon"><i class="mdi mdi-emoticon-sad"></i></span>
        Already Claimed
      </h1>
      <p>
        Sorry, the code you were trying to view is already claimed by someone else.
        Better luck next time!
      </p>
% end
    </div>
  </div>
</section>
