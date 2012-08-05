require 'net/http'

class XxlScraper

  PLAYER_LIST_REGEX = /http\:\/\/xxlgamers\.gameme\.com\/playerinfo\/(\d+)/
    STEAM_ID_REGEX = /http\:\/\/steamcommunity\.com\/profiles\/(\d+)/
    PLAYER_INFO = "http://xxlgamers.gameme.com/playerinfo/"

  class << self

    def scrape
      #url = "http://xxlgamers.gameme.com/tf"
      url = "http://xxlgamers.gameme.com/overview/17"
      page = retrieve_source(url)
      playerinfo_id_list = parse_source(page, PLAYER_LIST_REGEX)
      puts "parsed player info ids"
      steam_idz = []
      playerinfo_id_list.each do |id|
        EventMachine.run {
          id_page = EventMachine::HttpRequest.new(PLAYER_INFO + id.first.to_s).get
          id_page.errback { puts "uh oh"; EM.stop }
          id_page.callback {
            steam_idz << parse_source(id_page.response, STEAM_ID_REGEX)
            EventMachine.stop
          }
        }
      end
      print steam_idz.count
      steam_idz.each do |steam_id|
        if steam_id.any?
          bp = BP_Search.new steam_id.first.first
        end
      end
    end

    def retrieve_source(url)
      Net::HTTP.get_response(URI.parse(url)).body
    end

    def parse_source(page, regexp)
      player_info_id = page.scan regexp
      player_info_id.compact.uniq
    end

  end
end
