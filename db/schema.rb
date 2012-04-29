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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120429014847) do

  create_table "bp_searches", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "forcasts", :force => true do |t|
    t.integer  "low"
    t.integer  "high"
    t.integer  "current"
    t.string   "condition"
    t.string   "current_condition"
    t.integer  "current_condition_code"
    t.integer  "condition_code"
    t.string   "date_of_forcast"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "defindex"
    t.float    "float_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.integer  "zip"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noaa_forcasts", :force => true do |t|
    t.string   "observation_time"
    t.string   "weather"
    t.string   "temp_f"
    t.string   "relative_humidity"
    t.string   "wind_dir"
    t.string   "wind_degrees"
    t.string   "wind_mph"
    t.string   "wind_gust_mph"
    t.string   "pressure_mb"
    t.string   "dewpoint_f"
    t.string   "windchill_f"
    t.string   "visibility_mi"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "noaa_location_id"
  end

  create_table "noaa_locations", :force => true do |t|
    t.string   "station_id"
    t.string   "state"
    t.string   "station_name"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "xml_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "steam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "avatar"
    t.integer  "bit_column", :limit => 8
  end

  create_table "victims", :force => true do |t|
    t.integer  "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "xxl_scrapers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
