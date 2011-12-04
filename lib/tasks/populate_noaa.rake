namespace :db do
  desc "Erase and fill database"
  task :populate_noaa => :environment do
    require 'net/http'
    require 'rexml/document'
    create_locations
  end

  def get_the_info(string)
    ary = []
    @doc.elements.each(string) do |ele|
      ary << ele.text 
    end
    return ary
  end

  def create_locations
    url = "http://weather.gov/xml/current_obs/index.xml"
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    @doc = REXML::Document.new(xml_data)
    station_ids = get_the_info("wx_station_index/station/station_id")
    puts station_ids.count.to_s
    states = get_the_info("wx_station_index/station/state")
    puts states.count.to_s
    station_names = get_the_info("wx_station_index/station/station_name")
    puts station_names.count.to_s
    latitudes = get_the_info("wx_station_index/station/latitude")
    puts latitudes.count.to_s
    longitudes = get_the_info("wx_station_index/station/longitude")
    puts longitudes.count.to_s
    xml_urls = get_the_info("wx_station_index/station/xml_url")
    puts xml_urls.count.to_s
    (0..(station_ids.count - 1)).each{|i| 
      NoaaLocation.find_or_create_by_station_id(:station_id => station_ids[i].to_s, :state => states[i].to_s, :station_name => station_names[i].to_s, :latitude => latitudes[i].to_s, :longitude => longitudes[i].to_s, :xml_url => xml_urls[i].to_s)
      print "."
    }
  end
end
