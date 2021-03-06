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

ActiveRecord::Schema.define(version: 0) do

  create_table "cities", force: :cascade do |t|
    t.string  "name"
    t.integer "population"
    t.float   "lat"
    t.float   "long"
    t.integer "state_id"
    t.string  "full_name"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "landmarks", force: :cascade do |t|
    t.string  "name"
    t.integer "city_id"
    t.text    "description"
    t.string  "image_url"
  end

  add_index "landmarks", ["city_id"], name: "index_landmarks_on_city_id"

  create_table "owners", force: :cascade do |t|
    t.integer "user_id"
    t.integer "route_id"
    t.boolean "completed", default: false
  end

  add_index "owners", ["route_id"], name: "index_owners_on_route_id"
  add_index "owners", ["user_id"], name: "index_owners_on_user_id"

  create_table "routes", force: :cascade do |t|
    t.text    "name"
    t.integer "legs"
    t.text    "description"
  end

  create_table "states", force: :cascade do |t|
    t.string  "name"
    t.string  "abbreviation"
    t.integer "capital_city"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.boolean "admin",           default: false
    t.text    "password_digest"
  end

  create_table "waypoints", force: :cascade do |t|
    t.integer "route_id"
    t.integer "city_id"
    t.integer "route_number"
  end

  add_index "waypoints", ["city_id"], name: "index_waypoints_on_city_id"
  add_index "waypoints", ["route_id"], name: "index_waypoints_on_route_id"

end
