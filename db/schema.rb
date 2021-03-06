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

ActiveRecord::Schema[7.0].define(version: 2022_06_23_033123) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "floor_plans", force: :cascade do |t|
    t.string "name", null: false
    t.string "community", null: false
    t.integer "beds"
    t.integer "baths"
    t.date "available_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sq_ft"
    t.string "listing_link"
    t.index ["name", "community"], name: "index_floor_plans_on_name_and_community", unique: true
  end

  create_table "price_histories", force: :cascade do |t|
    t.integer "price"
    t.bigint "floor_plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["floor_plan_id"], name: "index_price_histories_on_floor_plan_id"
    t.index ["price"], name: "index_price_histories_on_price"
  end

  create_table "scrape_events", force: :cascade do |t|
    t.boolean "success", default: false, null: false
    t.string "scraper", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "price_histories", "floor_plans"
end
