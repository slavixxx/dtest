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

ActiveRecord::Schema.define(version: 20170207140258) do

  create_table "codes", force: :cascade do |t|
    t.text     "code",       limit: 65535
    t.integer  "coupon_id",  limit: 4
    t.boolean  "sold",                     default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "codes_deals", id: false, force: :cascade do |t|
    t.integer "code_id", limit: 4
    t.integer "deal_id", limit: 4
  end

  add_index "codes_deals", ["code_id"], name: "index_codes_deals_on_code_id", using: :btree
  add_index "codes_deals", ["deal_id"], name: "index_codes_deals_on_deal_id", using: :btree

  create_table "coupons", force: :cascade do |t|
    t.integer  "code_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "deals", force: :cascade do |t|
    t.text     "name",        limit: 65535
    t.text     "description", limit: 65535
    t.datetime "dealstart"
    t.datetime "dealend"
    t.integer  "maximum",     limit: 4
    t.integer  "minimum",     limit: 4
    t.text     "dealtype",    limit: 65535
    t.integer  "sellprice",   limit: 4
    t.integer  "dealprice",   limit: 4
    t.integer  "discount",    limit: 4
    t.boolean  "condition"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
