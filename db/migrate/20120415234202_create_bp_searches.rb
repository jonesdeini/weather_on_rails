class CreateBpSearches < ActiveRecord::Migration
  def change
    create_table :bp_searches do |t|

      t.timestamps
    end
  end
end
