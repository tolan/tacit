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

ActiveRecord::Schema.define(version: 2019_06_10_165711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.bigint "bridge_id"
    t.bigint "user_id"
    t.bigint "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "logo"
    t.index ["bank_id"], name: "index_accounts_on_bank_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.bigint "bridge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "bridge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operations", force: :cascade do |t|
    t.string "description"
    t.float "amount"
    t.date "date"
    t.bigint "bridge_id"
    t.bigint "user_id"
    t.bigint "subscription_id"
    t.bigint "category_id"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["account_id"], name: "index_operations_on_account_id"
    t.index ["category_id"], name: "index_operations_on_category_id"
    t.index ["subscription_id"], name: "index_operations_on_subscription_id"
    t.index ["user_id"], name: "index_operations_on_user_id"
  end

  create_table "operators", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "unsubcribe_number"
    t.text "unsubcribe_details"
    t.string "unsubcribe_address"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "regex"
    t.string "unsubcribe_letter"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "frequency"
    t.date "anniversary_date"
    t.date "next_date"
    t.bigint "operator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "end_date"
    t.index ["operator_id"], name: "index_subscriptions_on_operator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.string "first_name"
    t.string "last_name"
    t.integer "household"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "banks"
  add_foreign_key "accounts", "users"
  add_foreign_key "operations", "accounts"
  add_foreign_key "operations", "categories"
  add_foreign_key "operations", "subscriptions"
  add_foreign_key "operations", "users"
  add_foreign_key "subscriptions", "operators"
end
