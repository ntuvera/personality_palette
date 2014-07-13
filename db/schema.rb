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

ActiveRecord::Schema.define(version: 20140712182005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emotions", force: true do |t|
    t.integer  "entry_id"
    t.string   "type"
    t.integer  "intensity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emotions", ["entry_id"], name: "index_emotions_on_entry_id", using: :btree

  create_table "entries", force: true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.string   "event"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.string   "weather"
    t.string   "weather_img"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "emotion"
    t.integer  "emotion_num"
  end

  add_index "entries", ["user_id"], name: "index_entries_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",            null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
