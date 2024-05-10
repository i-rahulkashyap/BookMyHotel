class DropRoomTypes < ActiveRecord::Migration[6.0]
  def up
    drop_table :room_types
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end