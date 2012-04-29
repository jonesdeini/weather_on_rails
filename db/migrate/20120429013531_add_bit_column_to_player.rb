class AddBitColumnToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :bit_column, :bigint
  end
end
