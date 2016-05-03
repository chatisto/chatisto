$(document).on 'page:change', ->
  if title = document.getElementById("room-title")
    room = title.innerHTML
    username = Cookies.get(room + "_username")
    App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: room, username: username },
      connected: ->
        # Called when the subscription is ready for use on the server
      disconnected: ->
        # Called when the subscription has been terminated by the server
      received: (data) ->
        # TODO: enable desktop notifications (notify(data["username", data["message"]) see app/assets/javascripts/notifcations.js)
        # TODO: render messages
      speak: (message) ->
        @perform 'speak', message: message
  else if App.room
    App.room.unsubscribe()
    App.room = null
