class Player < ActiveRecord::Base
  require 'net/http' 

  #callbacks
  after_create :get_player_info

  #constants
  GET_PLAYER_INFO_API_CALL = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=987F12F50781CAE789D03E5A22D704D1&steamids="

  def get_player_info
    url = GET_PLAYER_INFO_API_CALL + steam_id
    raw_json = Net::HTTP.get_response(URI.parse(url)).body
    json = JSON.parse raw_json
    json["response"]["players"].each do |player|
      update_attributes(:name => player["personaname"], 
                        :avatar => player["avatarmedium"])
    end
  end
  #handle_asynchronously :get_player_info

end
