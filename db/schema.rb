# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150622164536) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "bank_id"
    t.integer  "contragent_id"
    t.integer  "acc_reg_no"
    t.string   "bank_account"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "bank_accounts", ["bank_id", "contragent_id"], name: "index_bank_accounts_on_bank_id_and_contragent_id"

  create_table "banks", force: :cascade do |t|
    t.integer  "city_id"
    t.integer  "post_index_id"
    t.string   "mfo_no"
    t.string   "bank_name"
    t.string   "cor_account"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "bank_reg_no",   limit: 8
  end

  add_index "banks", ["city_id", "post_index_id"], name: "index_banks_on_city_id_and_post_index_id"

  create_table "cities", force: :cascade do |t|
    t.string   "city_name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "city_reg_no", limit: 8
  end

  create_table "cont_types", force: :cascade do |t|
    t.string "cont_type"
  end

  create_table "contragents", force: :cascade do |t|
    t.integer  "cont_reg_no"
    t.string   "cont_name"
    t.integer  "cont_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_indices", force: :cascade do |t|
    t.integer  "city_id"
    t.integer  "post_index"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "index_reg_no", limit: 8
  end

  add_index "post_indices", ["city_id"], name: "index_post_indices_on_city_id"

end
