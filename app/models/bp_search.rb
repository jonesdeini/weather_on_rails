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
    if json["result"]["status"] == 1
      Item.all.each do |item|
        item.search json, @steam_id
      end
    end
  end

end
