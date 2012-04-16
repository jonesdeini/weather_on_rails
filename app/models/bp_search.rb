require 'net/http'
require 'json'

class BP_Search

API_CALL = "http://api.steampowered.com/IEconItems_440/GetPlayerItems/v0001/?key=987F12F50781CAE789D03E5A22D704D1&steamid="
  
  attr_accessor :crate_19

  def initialize(steam_id)
    url = API_CALL + steam_id
    raw_json = Net::HTTP.get_response(URI.parse(url)).body
    json = JSON.parse raw_json
    search json, 5022, 19
  end

  def search(json_obj, defindex, float_value) 
    if json_obj["result"]["status"] == 1
      json_obj["result"]["items"].each do |item|
        if item["defindex"] == defindex
          item["attributes"].each do |attrib|
            if attrib["float_value"] == float_value
              @crate_19 = true
            end
          end
        end
      end
    end
  end

end
