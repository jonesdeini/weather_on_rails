class LocationsController < ApplicationController

  def new
    @location = Location.find params[:id]
    if ! @location.nil?
      url = "http://xml.weather.yahoo.com/forecastrss?p=" + params[:id] + "&u=f"
      xml_data = Net::HTTP.get_response(URI.parse(url)).body
      @doc = REXML::Document.new(xml_data)
      @doc.elements.each("rss/channel/yweather:location") do |ele|
        city = ele.attributes["city"]
        state = ele.attributes["region"]   
        Location.create!(:zip => string.to_i, :state =>state, :city => city)
      end
    end
  end

  def show
    @location = Location.find params[:id]
  end
end
