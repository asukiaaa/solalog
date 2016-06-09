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

ActiveRecord::Schema.define(version: 20160609022333) do

  create_table "plants", force: :cascade do |t|
    t.string   "uuid",         limit: 255,   null: false
    t.string   "name",         limit: 255,   null: false
    t.text     "description",  limit: 65535
    t.string   "access_token", limit: 255,   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "plants", ["uuid"], name: "index_plants_on_uuid", unique: true, using: :btree

  create_table "power_logs", force: :cascade do |t|
    t.integer  "plant_id",     limit: 4,                            null: false
    t.decimal  "voltage",                  precision: 20, scale: 4, null: false
    t.decimal  "ampere",                   precision: 20, scale: 4, null: false
    t.datetime "logged_at",                                         null: false
    t.string   "creator_info", limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "user_plants", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "plant_id",   limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                 limit: 255, null: false
    t.string   "crypted_password",      limit: 255
    t.string   "salt",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                  limit: 255
    t.string   "facebook_id",           limit: 255
    t.string   "facebook_access_token", limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
