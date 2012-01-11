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

ActiveRecord::Schema.define(:version => 20120111213634) do

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

end
