class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :image
      t.integer :defindex
      t.float :float_value

      t.timestamps
    end
  end
end
