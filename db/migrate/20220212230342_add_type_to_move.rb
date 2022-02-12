class AddTypeToMove < ActiveRecord::Migration[7.0]
  def change
    add_reference :moves, :type, null: false, foreign_key: true
  end
end
