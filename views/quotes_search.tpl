% rebase("base.tpl", active="quotes_search")
<div class="row">
  <div class="small-12 columns">
    <h1><i class="fa fa-search"></i>&nbsp;Search Quotes</h1>
  </div>
</div>
<div class="row">
  <div class="small-11 small-centered columns">
    <form action="/quotes/search" method="POST" accept-charset="utf-8" data-abide>
      <fieldset>
        <legend>Filter Criteria</legend>

        <div class="keyword-field">
          <label>
            <i class="fa fa-tag"></i>&nbsp;Keyword
            <small>required</small>
            <input required type="text" name="keyword" pattern=".{3,}" placeholder="dickbutt">
          </label>
          <small class="error">Please specify at least three (3) characters.</small>
        </div>

        <label><i class="fa fa-search"></i>&nbsp;Scope</label>
        <div class="row">
          <label class="small-4 columns text-center">
            <input required checked type="radio" name="scope" value="Q">
            Quotation
          </label>
          <label class="small-4 columns text-center">
            <input required type="radio" name="scope" value="A">
            Attribution
          </label>
          <label class="small-4 columns text-center">
            <input required type="radio" name="scope" value="B">
            Both
          </label>
        </div>

        <div class="row">
          <div class="small-4 columns">
            <button type="reset" class="radius secondary expand button">
              <i class="fa fa-times"></i>&nbsp;Reset
            </button>
          </div>
          <div class="small-8 columns">
            <button type="submit" class="radius success expand button">
              <i class="fa fa-search"></i>&nbsp;Search
            </button>
          </div>
        </div>
      </fieldset>
    </form>
  </div>
</div>
