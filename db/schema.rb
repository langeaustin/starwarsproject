# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_26_183118) do

  create_table "beers", force: :cascade do |t|
    t.string "brand"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "birth_year"
    t.string "homeworld"
    t.integer "planet_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "beer_id"
    t.index ["beer_id"], name: "index_people_on_beer_id"
    t.index ["planet_id"], name: "index_people_on_planet_id"
  end

  create_table "people_vehicles", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "vehicle_id", null: false
    t.index ["person_id"], name: "index_people_vehicles_on_person_id"
    t.index ["vehicle_id"], name: "index_people_vehicles_on_vehicle_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "terrain"
    t.string "climate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "people", "beers"
  add_foreign_key "people", "planets"
  add_foreign_key "people_vehicles", "people"
  add_foreign_key "people_vehicles", "vehicles"
end
