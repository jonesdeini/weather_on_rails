class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :zip
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
