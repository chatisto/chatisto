class RoomsController < ApplicationController
  include MessageFormatHelper

  def login
    @room = Room.find_or_create_by(name: params[:id])
  end

  def show
    @room = Room.find_or_create_by(name: params[:id])
    if username_set?
      @username = format_message(username)
    else
      redirect_to login_room_path(@room.name)
    end
  end

  private
  def username_set?
    @room && username.present?
  end

  def username
    cookies["#{@room.name}_username"]
  end
end
