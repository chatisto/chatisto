class RoomsController < ApplicationController
  include EmojiHelper

  def login
    @room = Room.find_by!(name: params[:id])
  end

  def show
    @room = Room.find_by!(name: params[:id])
    if username_set?
      @username = emojify(username)
    else
      redirect_to login_room_path(@room.name)
    end
  end

  private
  def username_set?
    @room && username
  end

  def username
    cookies["#{@room.name}_username"]
  end
end
