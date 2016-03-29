class StartController < ApplicationController
  def show
    @public_rooms = Room.marked_public.ordered
    @generated_room = Room.generate
  end
end
