class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name, unique: true, null: false
      t.timestamps
    end

    add_foreign_key :messages, :rooms
  end
end
