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

ActiveRecord::Schema.define(version: 20150620112634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.integer  "city_id"
    t.integer  "post_index_id"
    t.string   "mfo_no"
    t.string   "bank_name"
    t.string   "cor_account"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "banks", ["city_id", "post_index_id"], name: "index_banks_on_city_id_and_post_index_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "city_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contragents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_indices", force: :cascade do |t|
    t.integer  "city_id"
    t.integer  "post_index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_indices", ["city_id"], name: "index_post_indices_on_city_id", using: :btree

end
