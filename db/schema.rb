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

ActiveRecord::Schema.define(version: 2021_01_02_041549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lived_ins", force: :cascade do |t|
    t.integer "year"
    t.bigint "place_id", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_lived_ins_on_person_id"
    t.index ["place_id"], name: "index_lived_ins_on_place_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.bigint "fb_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "place_id"
    t.index ["place_id"], name: "index_people_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "lived_ins", "people"
  add_foreign_key "lived_ins", "places"
  add_foreign_key "people", "places"
end
