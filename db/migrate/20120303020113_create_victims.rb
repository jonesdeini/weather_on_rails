class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.int :number

      t.timestamps
    end
  end
end
