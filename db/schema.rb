# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_10_191311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string "recipient"
    t.float "amount"
    t.datetime "due_date"
    t.bigint "user_id"
    t.bigint "billed_user_id"
    t.boolean "is_paid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billed_user_id"], name: "index_bills_on_billed_user_id"
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.bigint "user_id"
    t.text "description"
    t.float "hourly_rate"
    t.string "service_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "messaged_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content"], name: "index_messages_on_content"
    t.index ["messaged_user_id"], name: "index_messages_on_messaged_user_id"
    t.index ["user_id", "messaged_user_id", "content"], name: "index_messages_on_user_id_and_messaged_user_id_and_content", unique: true
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bills", "users"
  add_foreign_key "bills", "users", column: "billed_user_id"
  add_foreign_key "businesses", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "messages", "users", column: "messaged_user_id"
end
