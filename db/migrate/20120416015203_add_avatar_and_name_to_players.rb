class AddAvatarAndNameToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :name, :string
    add_column :players, :avatar, :string
  end
end
