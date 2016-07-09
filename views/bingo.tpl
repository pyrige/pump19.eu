<%
  bg_toggler = """
  $(".bingo-square").click(function() {
    $(this).toggleClass("stamped");
  })
  """

  rebase("base.tpl", active="bingo", extra_script=bg_toggler)
%>
<div class="row">
  <div class="small-12 columns">
    <h1><i class="fa fa-snapchat-ghost"></i>&nbsp;Let's Nope Trope Bingo</h1>
  </div>
</div>
<div class="row">
  <div class="small-11 small-centered columns">
    <p>
      This is your very own interactive <em>Let's Nope</em> Trope Bingo card.
      It is randomly generated each time you load this page.
      Be aware that your progress does not carry over should you happen to reload.
    </p>
  </div>
</div>
<div class="row">
  <div id="bingo-card" class="reveal-modal full" data-reveal role="dialog">
    <h2 id="bingo-card-title">
      Your Let's Nope Bingo Card
    </h2>
    <ul class="small-block-grid-5">
      % for letter in "SPOOP":
      <li class="text-center">
        <h1>{{letter}}</h1>
      </li>
      % end
      % for trope in tropes:
      <li class="bingo-square text-center">
        {{trope}}
      </li>
      % end
    </ul>
    <a class="close-reveal-modal" aria-label="Close">&#215;</a>
  </div>

  <div class="small-8 small-centered columns">
    <a href="#" data-reveal-id="bingo-card" class="button radius expand">Show my card</a>
  </div>
</div>
<div class="row">
  <div class="small-11 small-centered columns">
    <h3>Contribute</h3>
    <p>
      If you think we're missing some tropes, feel free to
      <a href="/contribute"><i class="fa fa-code-fork"></i>&nbsp;contribute</a>.
      Either open a new issue or send us a pull request on
      <a href="https://github.com/"><i class="fa fa-github"></i>&nbsp;GitHub</a>.
    </p>
  </div>
</div>
