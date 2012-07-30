class StrangeItem < Item
  
  def search(json)
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == self.defindex
        if players_item["quality"] == self.quality
          return true
        end
      end
    end
    return false
  end

end
