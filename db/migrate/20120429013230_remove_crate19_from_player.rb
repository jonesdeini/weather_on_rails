class RemoveCrate19FromPlayer < ActiveRecord::Migration
  def up
    remove_column :players, :crate_19
  end

  def down
    add_column :players, :crate_19, :boolean
  end
end
