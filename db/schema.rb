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

ActiveRecord::Schema.define(version: 20160710013623) do

  create_table "devices", force: :cascade do |t|
    t.integer  "hardware_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "readings", force: :cascade do |t|
    t.float    "temperature"
    t.float    "humidity"
    t.float    "particles"
    t.float    "carbon_monoxide"
    t.boolean  "heater_on"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "timestamp"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "device_id"
    t.index ["device_id"], name: "index_readings_on_device_id"
  end

end
