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

ActiveRecord::Schema[7.0].define(version: 2023_04_26_173817) do
  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "access_enabled"
    t.string "app"
    t.string "password"
    t.string "user_type"
    t.string "location"
    t.integer "average_minutes_used_last_30_days"
    t.decimal "fees_last_30_days"
    t.datetime "initial_access"
    t.datetime "last_access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
