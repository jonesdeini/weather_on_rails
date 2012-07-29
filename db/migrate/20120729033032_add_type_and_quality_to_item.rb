class AddTypeAndQualityToItem < ActiveRecord::Migration
  def self.up
    add_column :items, :type, :string
    add_column :items, :quality, :integer
  end

  def self.down
    remove_column :items, :type, :string
    remove_column :items, :quality, :integer
  end
end
