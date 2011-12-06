class AddNoaaLocationIdToNoaaForcast < ActiveRecord::Migration
  def change
    add_column :noaa_forcasts, :noaa_location_id, :integer
  end
end
