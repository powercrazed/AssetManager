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

ActiveRecord::Schema.define(version: 20170103092143) do

  create_table "devices", force: :cascade do |t|
    t.string   "name"
    t.integer  "tag"
    t.string   "dev_type"
    t.string   "make"
    t.string   "model"
    t.string   "serial"
    t.date     "purchased_on"
    t.integer  "warranty_length"
    t.string   "warranty_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "person_id"
    t.text     "notes"
  end

  add_index "devices", ["person_id"], name: "index_devices_on_person_id"

  create_table "licences", force: :cascade do |t|
    t.string   "vendor"
    t.string   "app_name"
    t.string   "version"
    t.string   "edition"
    t.string   "channel"
    t.string   "purchased_from"
    t.date     "purchased_on"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "device_id"
    t.boolean  "in_use"
    t.integer  "person_id"
    t.text     "notes"
  end

  add_index "licences", ["device_id"], name: "index_licences_on_device_id"
  add_index "licences", ["person_id"], name: "index_licences_on_person_id"

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
