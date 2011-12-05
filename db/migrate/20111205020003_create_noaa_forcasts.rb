class CreateNoaaForcasts < ActiveRecord::Migration
  def change
    create_table :noaa_forcasts do |t|
      t.string :observation_time
      t.string :weather
      t.string :temp_f
      t.string :relative_humidity
      t.string :wind_dir
      t.string :wind_degrees
      t.string :wind_mph
      t.string :wind_gust_mph
      t.string :pressure_mb
      t.string :dewpoint_f
      t.string :windchill_f
      t.string :visibility_mi

      t.timestamps
    end
  end
end
