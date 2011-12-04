class CreateNoaaLocations < ActiveRecord::Migration
  def change
    create_table :noaa_locations do |t|
      t.string :station_id
      t.string :state
      t.string :station_name
      t.string :latitude
      t.string :longitude
      t.string :xml_url

      t.timestamps
    end
  end
end
