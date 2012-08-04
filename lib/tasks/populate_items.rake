namespace :db do 
  task :populate_items => %w( populate_strange_festive_weapons )

  desc "populating strange festive weapons"
  task :populate_strange_festive_weapons => :environment do |task|
    puts task.full_comment
    list = YAML.load_file("#{Rails.root}/db/strange_festives.yml")
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

