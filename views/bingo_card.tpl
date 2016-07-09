% from itertools import islice
<table id="bingo-card">
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

<script type="text/javascript">
  $(".bingo-square").click(function() {
    $(this).toggleClass("stamped");
  });
</script>
