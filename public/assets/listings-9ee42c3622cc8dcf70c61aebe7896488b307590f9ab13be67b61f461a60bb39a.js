(function() {
  jQuery(function() {
    var courses;
    $('#listing_course_ids').parent().parent().parent().hide();
    courses = $('#listing_course_ids').html();
    return $('#listing_category_ids').change(function() {
      var categories, options;
      categories = [];
      $('#listing_category_ids :selected').each(function() {
        return categories.push($(this).text());
      });
      options = [];
      $(categories).each(function() {
        return options.push($(courses).filter("optgroup[label='" + this + "']").html());
      });
      if (options) {
        $('#listing_course_ids').html(options);
        $('.selectpicker').selectpicker('refresh');
        return $('#listing_course_ids').parent().parent().parent().show();
      } else {
        $('#listing_course_ids').empty();
        return $('#listing_course_ids').parent().parent().parent().hide();
      }
    });
  });

}).call(this);
