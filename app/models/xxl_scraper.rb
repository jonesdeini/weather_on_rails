require 'net/http'

class XxlScraper

  PLAYER_LIST_REGEX = /http\:\/\/xxlgamers\.gameme\.com\/playerinfo\/(\d+)/
    STEAM_ID_REGEX = /http\:\/\/steamcommunity\.com\/profiles\/(\d+)/
    PLAYER_INFO = "http://xxlgamers.gameme.com/playerinfo/"

  class << self

    def scrape
      url = "http://xxlgamers.gameme.com/tf"
      page = retrieve_source(url)
      playerinfo_id_list = parse_source(page, PLAYER_LIST_REGEX)
      puts "parsed player info ids"
      steam_idz = []
      playerinfo_id_list.each do |id|
        puts (PLAYER_INFO + id.first.to_s)
        id_page = retrieve_source(PLAYER_INFO + id.first.to_s)
        steam_idz << parse_source(id_page, STEAM_ID_REGEX)
        print "*"
      end
      print "\n"
      steam_idz.each do |steam_id| 
        if steam_id.any?
          bp = BP_Search.new steam_id.first.first
        end
      end
    end

    def retrieve_source(url)
      Net::HTTP.get_response(URI.parse(url)).body
    end
    #handle_asynchronously :retrieve_source

    def parse_source(page, regexp)
      player_info_id = page.scan regexp
      player_info_id.compact.uniq
    end

  end
end
