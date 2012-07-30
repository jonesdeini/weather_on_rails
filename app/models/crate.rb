class Crate < Item

  def search(json, steam_id)
    json["result"]["items"].each do |players_item|
      if players_item["defindex"] == defindex
        if players_item["attributes"]
          players_item["attributes"].each do |attrib|
            if attrib["float_value"] == float_value
              return true
            end
          end
        end
      end
    end
    return false
  end

end
