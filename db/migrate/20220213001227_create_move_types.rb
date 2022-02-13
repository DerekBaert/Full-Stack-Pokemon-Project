class CreateMoveTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :move_types do |t|
      t.references :move, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
