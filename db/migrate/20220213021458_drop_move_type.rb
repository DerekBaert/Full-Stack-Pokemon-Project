class DropMoveType < ActiveRecord::Migration[7.0]
  def change
    drop_table :move_types
  end
end
