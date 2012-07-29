class Crate < Item

  def search(json)
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == defindex
        if players_item["attributes"]
          players_item["attributes"].each do |attrib|
            if attrib["float_value"] == float_value
              p = Player.find_or_create_by_steam_id :steam_id => @steam_id 
              p.inventories.create :item => self
            end
          end
        end
      end
    end
  end

end
