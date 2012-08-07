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
    raw_json = EventMachine::HttpRequest.new(url).get
    raw_json.errback { puts "steam api error" }
    raw_json.callback {
      json = JSON.parse raw_json.response
      if json["result"]["status"] == 1
        Item.all.each do |item|
          if item.search json
            p = Player.new :steam_id => @steam_id
            if p.valid?
              p.save
              p.inventories.create :item => item
            end
          end
        end
      end
    }
  end

end
