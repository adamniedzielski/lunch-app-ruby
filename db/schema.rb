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

ActiveRecord::Schema[8.0].define(version: 2024_06_27_121816) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cuisines", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lunches", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_lunches_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "location_id", null: false
    t.bigint "cuisine_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "closed_on", default: [], array: true
    t.datetime "deactivated_at"
    t.index ["cuisine_id"], name: "index_restaurants_on_cuisine_id"
    t.index ["location_id"], name: "index_restaurants_on_location_id"
  end

  add_foreign_key "lunches", "restaurants"
  add_foreign_key "restaurants", "cuisines"
  add_foreign_key "restaurants", "locations"
end
