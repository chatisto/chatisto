$(document).on 'page:change', ->
  if title = document.getElementById("room-title")
    room = title.innerHTML
    username = Cookies.get(room + "_username")
    if username
      subscribeToRoom(room, username)
    else
      input = escape(prompt("Enter a username"))
      # TODO: validations..
      Cookies.set(room + "_username", input)
      # TODO: animations
      username = if input then input else "unknown user"
      subscribeToRoom(room, username)
  else if App.room
    console.log "unsubscribe"
    App.room.unsubscribe()
    App.room = null

subscribeToRoom = (room, username) ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: room, username: username },
      connected: ->
        # Called when the subscription is ready for use on the server
      disconnected: ->
        # Called when the subscription has been terminated by the server
      received: (data) ->
        # TODO: enable desktop notifications (notify(data["username", data["message"]) see app/assets/javascripts/notifcations.js)
        # TODO: render messages
        console.log data["username"] + ": " + data["message"]
      speak: (message) ->
        @perform 'speak', message: message
