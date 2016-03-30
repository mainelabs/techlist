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

ActiveRecord::Schema.define(version: 20160330184338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",               default: 0, null: false
    t.integer  "attempts",               default: 0, null: false
    t.text     "handler",                            null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "place_updates", force: :cascade do |t|
    t.integer  "place_id"
    t.string   "state",        limit: 255
    t.string   "name",         limit: 255
    t.string   "kind",         limit: 255
    t.string   "street",       limit: 255
    t.string   "zip_code",     limit: 255
    t.string   "city",         limit: 255
    t.string   "url",          limit: 255
    t.text     "description"
    t.string   "owner_name",   limit: 255
    t.string   "owner_email",  limit: 255
    t.string   "logo_url",     limit: 255
    t.string   "twitter_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "kind",         limit: 255
    t.string   "street",       limit: 255
    t.string   "zip_code",     limit: 255
    t.string   "city",         limit: 255
    t.string   "url",          limit: 255
    t.text     "description"
    t.string   "owner_name",   limit: 255
    t.string   "owner_email",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",        limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.string   "logo_url",     limit: 255
    t.string   "twitter_name", limit: 255
    t.string   "country_code", limit: 255, default: "FR"
    t.string   "slug"
  end

  add_index "places", ["city"], name: "index_places_on_city", using: :btree
  add_index "places", ["description"], name: "index_places_on_description", using: :btree
  add_index "places", ["name"], name: "index_places_on_name", using: :btree
  add_index "places", ["street"], name: "index_places_on_street", using: :btree
  add_index "places", ["twitter_name"], name: "index_places_on_twitter_name", using: :btree
  add_index "places", ["url"], name: "index_places_on_url", using: :btree
  add_index "places", ["zip_code"], name: "index_places_on_zip_code", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                              default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
