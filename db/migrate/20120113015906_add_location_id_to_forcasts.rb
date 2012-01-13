class AddLocationIdToForcasts < ActiveRecord::Migration
  def change
    add_column :forcasts, :location_id, :int
  end
end
