module ItemSearch

  def basic_search(json, item)
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == item.defindex
        return true
      end
    end
    return false
  end

  def quality_search(json, item)
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == item.defindex
        if players_item["quality"] == item.quality
          return true
        end
      end
    end
    return false
  end

  def crate_search(json, item)
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == item.defindex
        return true
      end
    end
    return false
  end

end
