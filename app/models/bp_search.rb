require 'net/http'
require 'json'

class BP_Search

  API_CALL = "http://api.steampowered.com/IEconItems_440/GetPlayerItems/v0001/?key="
  
  attr_accessor :steam_id
  def initialize(steam_id)
    @steam_id = steam_id
    retrieve_items
  end

  def retrieve_items
    url = API_CALL + APP_CONFIG["api_key"] + "&steamid=#{@steam_id}"
    raw_json = Net::HTTP.get_response(URI.parse(url)).body
    json = JSON.parse raw_json
    Item.all.each do |item|
      search json, item 
    end
  end
  #might not need this/might blow up
  #handle_asynchronously :retrieve_items

  def search(json_obj, wanted_item)
    if json_obj["result"]["status"] == 1
      json_obj["result"]["items"].each do |players_item|
        if players_item["defindex"] == wanted_item.defindex
          players_item["attributes"].each do |attrib|
            if attrib["float_value"] == wanted_item.float_value
              p = Player.find_or_create_by_steam_id @steam_id 
              #maybe i dont understand has_many
              p.items.create wanted_item
            end
          end
        end
      end
    end
  end

end
