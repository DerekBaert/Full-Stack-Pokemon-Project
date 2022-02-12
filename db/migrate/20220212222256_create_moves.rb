class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :accuracy
      t.string :damage_type
      t.text :effect
      t.integer :power
      t.integer :pp

      t.timestamps
    end
  end
end
