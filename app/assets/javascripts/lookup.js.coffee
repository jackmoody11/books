# $(document).ready ->
#   TIMEOUT = null
#   $('body').on 'keyup', 'input#isbn_field', ->
#     clearTimeout TIMEOUT
#     TIMEOUT = setTimeout((->
#       ajaxResponse = $.ajax(
#         url: '/listings/lookup'
#         type: 'GET'
#         data:
#           isbn: $('input#isbn_field').val())
#       ajaxResponse.success (data) ->
#         $('#isbn-lookup-results-container').html data
#         $('#form-unfilled').hide()
#         $('.selectpicker').selectpicker('refresh')
#         return
#       ajaxResponse.error (data) ->
#         alert 'Not a valid ISBN'
#         $('.selectpicker').selectpicker('refresh')
#         return
#       return
#     ), 2000)
#     return
#   return
