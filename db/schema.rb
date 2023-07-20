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

ActiveRecord::Schema[7.0].define(version: 2023_07_20_122414) do
  create_table "publications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.text "corporator_authors"
    t.string "title"
    t.string "journal_name"
    t.date "release_date"
    t.string "volume"
    t.string "issue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_publications_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "name"
    t.string "email"
    t.text "biography"
    t.string "phoneNumber"
    t.string "address"
    t.text "outerLink"
    t.string "role"
    t.text "avatar"
    t.text "resume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
