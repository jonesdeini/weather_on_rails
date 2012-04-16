class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :steam_id
      t.boolean :crate_19

      t.timestamps
    end
  end
end
