class AddMarkedPublicToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :marked_public, :boolean, default: false
  end
end
