# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from channel_name
    broadcast_message(username: "*",
                      message: "#{username} joined the room")
  end

  def unsubscribed
    broadcast_message(username: "*",
                      message: "#{username} left the room")
  end

  def speak(data)
    broadcast_message(username: username,
                      message: data["message"])
  end

  def broadcast_message(username:, message:)
    ActionCable.server.broadcast(channel_name,
                                 username: username,
                                 message: message)
  end

  def channel_name
    "room_channel_#{room}"
  end

  def username
    params[:username]
  end

  def room
    params[:room]
  end
end
