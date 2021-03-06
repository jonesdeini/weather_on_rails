namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'net/http'
    require 'rexml/document'
    split_up_zipcodes
  end

  def split_up_zipcodes
    file = File.new('zipcodes')
    strings = file.first.split("\" \"")
    strings.each{|str| str.chomp!}
    strings.each{|str| create_location str}
  end

  def create_location(string)
    sleep 1.5
    url = "http://xml.weather.yahoo.com/forecastrss?p=" + string + "&u=f"
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    @doc = REXML::Document.new(xml_data)
    @doc.elements.each("rss/channel/yweather:location") do |ele|
      city = ele.attributes["city"]
      state = ele.attributes["region"]   
      Location.find_or_create_by_zip :zip => string.to_i, :state =>state, :city => city
    end
    print "."
  end
end
