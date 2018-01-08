 jQuery ->
  $('#listing_course_ids').parent().parent().hide() # Hides entire form group
  courses = $('#listing_course_ids').html()
  $('#listing_category_ids').change ->
    categories = []
    $('#listing_category_ids :selected').each ->
      categories.push($(this).text()) # Add all categories to array
    # escaped_categories = categories.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    # Don't think this is needed, but will leave for reference in case
    options = []
    $(categories).each ->
      options.push($(courses).filter("optgroup[label='#{this}']").html()) # Add all options
      # console.log(options) for testing
    if options
      $('#listing_course_ids').html(options)
      $('.selectpicker').selectpicker('refresh');
      $('#listing_course_ids').parent().parent().parent().show()
    else
      $('#listing_course_ids').empty()
      $('#listing_course_ids').parent().parent().parent().hide()
