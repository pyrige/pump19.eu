% rebase("base.tpl", active="commands")
<main class="row align-center">
  <section class="small-11 column">
    <h1>
      <i class="fa fa-keyboard-o"></i>
      Commands
    </h1>
    <p>
      Here you can find a <small>mostly</small> complete and <small>probably</small> accurate list of commands supported by Pump19.
      If you find the documentation lacking or think we could use additional commands, feel free to <a href="/contribute"><i class="fa fa-medkit"></i>&nbsp;contribute</a> feature and pull requests.
    </p>
  </section>
  <section class="small-11 columns">
  % for command in commands:
    <div class="callout clearfix">
    % if "url" in command:
      <a href="{{command["url"]}}" class="secondary button float-right">
        <i class="fa fa-external-link"></i>&nbsp;Link
      </a>
    % end
      <h6>
        <i class="fa fa-info"></i>
        {{command["desc"]}}
      </h6>
      <ul>
      % if isinstance(command["trigger"], str):
        <li><code>{{command["trigger"]}}</code></li>
      % else:
        % for trigger in command["trigger"]:
        <li><code>{{trigger}}</code></li>
        % end
      % end
      </ul>
    % if "example" in command:
      <span class="secondary label">
        Example
        <i class="fa fa-terminal"></i>
        <kbd>{{command["example"]}}</kbd>
      </span>
    % end
    </div>
  %end
  </section>
</main>
