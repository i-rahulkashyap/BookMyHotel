class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :hotel, null: false, foreign_key: true
      t.integer :room_number
      t.string :room_type
      t.integer :capacity
      t.decimal :price

      t.timestamps
    end
  end
end
