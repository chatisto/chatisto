class RoomsController < ApplicationController
  def show
    @room = Room.find_by!(name: params[:id])
  end
end
