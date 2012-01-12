namespace :db do
  desc "Generate forcast records"
  task :retrieve_forcasts => :environment do
    require 'net/http'
    require 'rexml/document'
    retrieve_forcast
  end

  def retrieve_forcast
    Location.all.each do |location|
      sleep 1.5
      url ="http://xml.weather.yahoo.com/forecastrss?p=" + location.zip.to_s + "&u=f"
      xml_data = Net::HTTP.get_response(URI.parse(url)).body
      @doc = REXML::Document.new(xml_data)
      new_forcast = Forcast.new
      @doc.elements.each("rss/channel/item/yweather:condition") do |ele|
        new_forcast.current_condition = ele.attributes["text"]
        new_forcast.current_condition_code = ele.attributes["code"]
        new_forcast.current = ele.attributes["temp"]
        new_forcast.date_of_forcast = ele.attributes["date"]
      end
      @doc.elements.each("rss/channel/item/yweather:forecast") do |ele|
        new_forcast.low = ele.attributes["low"]
        new_forcast.high = ele.attributes["high"]
        new_forcast.condition = ele.attributes["text"]
        new_forcast.condition_code = ele.attributes["code"]
      end
      new_forcast.save and print "."
    end
  end
end
