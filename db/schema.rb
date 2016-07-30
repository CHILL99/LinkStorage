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

ActiveRecord::Schema.define(version: 20160730111833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.string   "bookmark"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "car_rates", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.float  "rate"
  end

  create_table "mile_costs", force: :cascade do |t|
    t.integer  "shipment_settings_id"
    t.integer  "from_mile"
    t.integer  "to_mile"
    t.integer  "price"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "mile_costs", ["shipment_settings_id"], name: "index_mile_costs_on_shipment_settings_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "geo_origin"
    t.string   "geo_origin_key"
    t.string   "geo_destination"
    t.string   "geo_destination_key"
    t.integer  "distance"
    t.integer  "car_rate_id"
    t.boolean  "operable"
    t.string   "transport_type"
    t.string   "email"
    t.string   "shipping_date"
    t.integer  "order_price"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "shipment_settings", force: :cascade do |t|
    t.float    "operable_cost"
    t.float    "enclosed_cost"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
