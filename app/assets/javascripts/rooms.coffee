# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Link preview (in chat): https://github.com/Ekito/bootstrap-linkpreview/blob/master/library/js/bootstrap-linkpreview.js
# TODO: request username
# TODO: validate user input
console.log "hallo"

$(document).on 'page:change', ->
  $('#login-form').validator().on 'submit', (e) ->
    unless e.isDefaultPrevented()
      room_name = document.getElementById('login-form').dataset.roomName
      username = document.getElementById('login-username').value
      Cookies.set("#{room_name}_username", username)
      path = document.getElementById('login-form').dataset.roomPath
      e.preventDefault()
      Turbolinks.visit(path)
  $('#login-submit').on 'click', ->
    $('#login-form').submit()
