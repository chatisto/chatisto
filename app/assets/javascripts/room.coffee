# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
room_id = window.location.pathname.split("/rooms/")[1]

if room_id && !Cookies.get(room_id + "_username")
  input = escape(prompt("Enter a username"))
  # TODO: validations..
  Cookies.set(room_id + "_username", input)
  window.location.href = window.location
  # TODO: animations

# Link preview: https://github.com/Ekito/bootstrap-linkpreview/blob/master/library/js/bootstrap-linkpreview.js