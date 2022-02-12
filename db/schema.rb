# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_02_12_230342) do
  create_table "generations", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.integer "accuracy"
    t.string "damage_type"
    t.text "effect"
    t.integer "power"
    t.integer "pp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "generation_id", null: false
    t.integer "type_id", null: false
    t.index ["generation_id"], name: "index_moves_on_generation_id"
    t.index ["type_id"], name: "index_moves_on_type_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "sprite"
    t.integer "number"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "generation_id", null: false
    t.index ["generation_id"], name: "index_pokemons_on_generation_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "generation_id", null: false
    t.index ["generation_id"], name: "index_types_on_generation_id"
  end

  add_foreign_key "moves", "generations"
  add_foreign_key "moves", "types"
  add_foreign_key "pokemons", "generations"
  add_foreign_key "types", "generations"
end