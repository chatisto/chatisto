$(document).on 'page:change', (event) ->
  room_id = window.location.pathname.split("/rooms/")[1]
  username = Cookies.get(room_id + '_username')
  if room_id && username
    App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: room_id, username: username },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        # TODO: enable desktop notifications, UI changes
        # desktop notifications
        # notify(data["username", data["message"]) see app/assets/javascripts/notifcations.js
        console.log data["username"] + ": " + data["message"]

      speak: (message) ->
        @perform 'speak', message: message
