% rebase("base.tpl", active="bingo")
<div class="row">
  <div class="small-12 columns">
    <h1><i class="fa fa-puzzle-piece"></i>&nbsp;Trope Bingo</h1>
  </div>
</div>
<div class="row">
  <div class="small-11 small-centered columns">
    <p>
      These are your very own interactive <strong>Trope Bingo</strong> card.
      You can choose between tropes that are common cause for frustration in either <em>Let's Nope</em> and <em>Watch &amp; Play</em> (or both).
      The cards are randomly generated each time you load the respective page.
      Be aware that your progress does not carry over should you happen to reload.
    </p>
  </div>
</div>
<div class="row">
  <div id="bingo-card-modal" class="reveal-modal full" data-reveal role="dialog">
  </div>

  <div class="small-10 small-centered columns">
    <ul class="even-2 stack-for-small radius button-group">
      <li>
        <a class="button" href="/bingo/leno" data-reveal-id="bingo-card-modal" data-reveal-ajax=true>
          <i class="fa fa-key"></i>&nbsp;Let's Nope
        </a>
      </li>
      <li>
        <a class="button" href="/bingo/wap" data-reveal-id="bingo-card-modal" data-reveal-ajax=true>
          <i class="fa fa-meh-o"></i>&nbsp;Watch &amp; Play
        </a>
      </li>
    </ul>
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
