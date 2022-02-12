class CreateGenerations < ActiveRecord::Migration[7.0]
  def change
    create_table :generations do |t|
      t.string :name
      t.string :region

      t.timestamps
    end
  end
end
