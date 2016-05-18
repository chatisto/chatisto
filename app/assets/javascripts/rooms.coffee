# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Link preview (in chat): https://github.com/Ekito/bootstrap-linkpreview/blob/master/library/js/bootstrap-linkpreview.js
$(document).on 'page:change', ->
  $('#login-username').val(Cookies.get($("#login-title strong").text() + "_username"))
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
  $('#message-input-form').on 'submit', (e) ->
    e.preventDefault()
    input = document.getElementById('message-input')
    message = input.value
    if App.room.speak(message)
      input.value = ""
    else
       alert("fail!")
  $('#emoji-button').on 'click', ->
    win = window.open('http://www.emoji-cheat-sheet.com/', '_blank')
    win.focus()

window.addEventListener "focus", ->
  input_field = document.getElementById('message-input')
  input_field.focus() if input_field
