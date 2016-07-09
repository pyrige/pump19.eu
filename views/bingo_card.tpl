% from itertools import islice
<h2 id="bingo-card-title"><i class="fa fa-puzzle-piece"></i>&nbsp;Trope Bingo Card</h2>
<table id="bingo-card">
  <thead>
    <tr>
    % for letter in "TROPE":
      <th class="text-center">
        <h3>{{letter}}</h3>
      </th>
    % end
    </tr>
  </thead>
  <tbody>
  % for row in range(5):
  <tr>
    % start, stop = 5 * row, 5 + 5 * row
    % for trope in islice(tropes, start, stop):
    <td class="bingo-square">
      {{trope}}
    </td>
    % end
  </tr>
  % end
  </tbody>
</table>

<a class="close-reveal-modal" aria-label="Close">
  <i class="fa fa-times-circle"></i>&nbsp;Close
</a>

<script type="text/javascript">
  $(".bingo-square").click(function() {
    $(this).toggleClass("stamped");
  })
</script>
