class RoomsController < ApplicationController
  def login
    @room = Room.find_by!(name: params[:id])
  end

  def show
    @room = Room.find_by!(name: params[:id])
    unless username_set?
      redirect_to login_room_path(@room.name)
    end
  end

  private
  def username_set?
    @room && cookies["#{@room.name}_username"]
  end
end
