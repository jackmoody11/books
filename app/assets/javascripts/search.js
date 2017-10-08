$(document).ready(function() {
  $(document).on('keyup','#listings_search input',function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });

  $("#listings th a, #listings .pagination a").on("click", function() {
    $.getScript(this.href);
    return false;
  });

});
