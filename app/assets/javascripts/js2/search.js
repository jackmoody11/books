$(function() {
  $("#listings th a, #listings .pagination a").on("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#listings_search input").keyup(function() {
    $.get($("#listings_search").attr("action"), $("#listings_search").serialize(), null, "script");
    return false;
  });
 });
