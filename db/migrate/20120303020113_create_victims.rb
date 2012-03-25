class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.integer :phone_number
      t.timestamps
    end
  end
end
