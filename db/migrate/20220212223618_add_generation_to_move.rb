class AddGenerationToMove < ActiveRecord::Migration[7.0]
  def change
    add_reference :moves, :generation, null: false, foreign_key: true
  end
end
