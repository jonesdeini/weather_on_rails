class StrangeItem < Item
  
  def search(json, steam_id)
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == self.defindex
        if players_item["quality"] == self.quality
          p = Player.find_or_create_by_steam_id :steam_id => steam_id 
          p.inventories.create :item => self
        end
      end
    end
  end

end
