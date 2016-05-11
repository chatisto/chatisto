# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  include EmojiHelper

  def subscribed
    broadcast_message(username: ":mega:",
                      message: "#{username} joined the room")
    stream_from channel_name
  end

  def unsubscribed
    broadcast_message(username: ":mega:",
                      message: "#{username} left the room")
  end

  def speak(data)
    broadcast_message(username: username,
                      message: data["message"]) if data["message"].present?
  end

  def broadcast_message(username:, message:)
    ActionCable.server.broadcast(channel_name,
                                 username: emojify(username),
                                 plain_username: username,
                                 message: emojify(message))
    room.update! updated_at: Time.now
  end

  def channel_name
    "room_channel_#{room_name}"
  end

  def username
    params[:username]
  end

  def room_name
    params[:room]
  end

  def room
    Room.find_by!(name: room_name)
  end
end
