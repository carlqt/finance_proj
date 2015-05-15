# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#link_to_remove').on 'click', (event) ->
    $(this).prev("input[type=hidden]").val("1")
    $(this).closest(".fields").hide()
    event.preventDefault()
