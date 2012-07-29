namespace :db do 
  desc "populate items table"
  task :populate_items => :environment do
    list = YAML.load_file("#{Rails.root}/db/wishlist.yml")
    list.each do |item|
      new_item = Item.find_or_create_by_name \
        :name => item.first,
        :defindex => item.last["defindex"],
        :type => item.last["type"]
      new_item.quality = item.last["quality"].to_f if item.last["quality"]
      new_item.float_value = item.last["float_value"].to_f if item.last["float_value"]
      new_item.save
      puts new_item.name
    end
  end
end

