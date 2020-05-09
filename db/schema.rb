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

ActiveRecord::Schema.define(version: 2020_05_09_003124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.date "submit_date"
    t.date "decision_date"
    t.date "review_date"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "borrower_id"
  end

  create_table "borrowers", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "business_segment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "relationship_mgr_id"
    t.integer "application_id"
  end

  create_table "loans", force: :cascade do |t|
    t.decimal "principal_amount"
    t.decimal "interest_rate"
    t.date "maturity_date"
    t.integer "term"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "application_id"
  end

  create_table "relationship_mgrs", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.integer "employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "borrowers", "applications"
end
