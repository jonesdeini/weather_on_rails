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
      id_page = []
      EM.run {
        playerinfo_id_list.each_with_index do |id, index|
          id_page[index] = EventMachine::HttpRequest.new(PLAYER_INFO + id.first.to_s).get
          puts "request #{index} started"
          id_page[index].errback { puts "request #{index} xxl error"; EM.stop }
          id_page[index].callback {
            puts "request #{index} callback"
            #BP_Search.new (parse_source(id_page.response, STEAM_ID_REGEX)).first.first
            steam_idz << parse_source(id_page[index].response, STEAM_ID_REGEX)
            puts "request #{index} stopping"
            EM.stop
          }
        end
      }
      puts steam_idz.count
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
