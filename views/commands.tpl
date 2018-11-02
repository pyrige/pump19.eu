% rebase("base.tpl", active="commands")
<section class="section">
  <div class="content container">
    <h1>
      <span class="icon"><i class="mdi mdi-console"></i></span>
      Commands
    </h1>
    <p>
      Here you can find a <small>mostly</small> complete and <small>probably</small> accurate list of commands supported by Pump19.
      If you find the documentation lacking or think we could use additional commands, feel free to <a href="/contribute"><span class="icon"><i class="mdi mdi-medical-bag"></i></span>contribute</a> feature and pull requests.
    </p>
  </div>
  <div class="container">
  % for command in commands:
    <div class="message">
      <div class="message-header">
        <p>
          <span class="icon"><i class="mdi mdi-console-line"></i></span>
          <kbd>{{command["trigger"]}}</kbd>
        </p>
      </div>
      <div class="message-body content">
        <div class="columns">
          <div class="column">
            <p>
              {{command["desc"]}}
            </p>
          </div>
          % if "url" in command:
          <div class="column is-narrow">
            <a href="{{command["url"]}}" class="button is-primary is-small">
              <span class="icon"><i class="mdi mdi-link-variant"></i></span>
              <span>Link</span>
            </a>
          </div>
          % end
        </div>
      </div>
    </div>
  %end
</section>
