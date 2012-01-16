class CreateForcasts < ActiveRecord::Migration
  def change
    create_table :forcasts do |t|
      t.integer :low
      t.integer :high
      t.integer :current
      t.string :condition
      t.string :current_condition
      t.integer :current_condition_code
      t.integer :condition_code
      t.string :date_of_forcast

      t.timestamps
    end
  end
end
