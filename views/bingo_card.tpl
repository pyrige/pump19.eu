<h1 id="bingo-card-title">Your Trope Bingo Card</h1>
<ul class="small-block-grid-5">
  % for letter in "TROPE":
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

<a class="close-reveal-modal" aria-label="Close">
  <i class="fa fa-times-circle"></i>&nbsp;Close
</a>

<script type="text/javascript">
  $(".bingo-square").click(function() {
    $(this).toggleClass("stamped");
  })
</script>
