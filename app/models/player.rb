# == Schema Information
#
# Table name: players
#
#  id         :integer         not null, primary key
#  steam_id   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  avatar     :string(255)
#  bit_column :integer(8)
#

class Player < ActiveRecord::Base
  require 'net/http' 

  #callbacks
  after_create :get_player_info

  #relations
  has_many :items
  
  #constants
  GET_PLAYER_INFO_API_CALL = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key="

  def get_player_info
    url = GET_PLAYER_INFO_API_CALL + APP_CONFIG["api_key"] + "&steam_ids=#{steam_id}"
    raw_json = Net::HTTP.get_response(URI.parse(url)).body
    json = JSON.parse raw_json
    json["response"]["players"].each do |player|
      update_attributes(:name => player["personaname"], 
                        :avatar => player["avatarmedium"])
    end
  end
  handle_asynchronously :get_player_info

end