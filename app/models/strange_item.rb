class StrangeItem < Item
  
  def search(json)
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == defindex
        if players_item["quality"] == quality
          p = Player.find_or_create_by_steam_id :steam_id => @steam_id 
          p.inventories.create :item => self
        end
      end
    end
  end

end
