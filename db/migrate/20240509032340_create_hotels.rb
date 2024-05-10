class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.integer :total_rooms
      t.integer :rooms_left

      t.timestamps
    end
  end
end
