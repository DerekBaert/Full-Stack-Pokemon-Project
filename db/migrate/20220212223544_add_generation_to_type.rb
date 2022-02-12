class AddGenerationToType < ActiveRecord::Migration[7.0]
  def change
    add_reference :types, :generation, null: false, foreign_key: true
  end
end
