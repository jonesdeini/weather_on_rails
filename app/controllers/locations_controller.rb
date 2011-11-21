class LocationsController < ApplicationController

  def index
    @location = Location.all
  end


  def create
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
    else
       render :nothing => true
    end
  end

  def show
    #this is a pretty shitty way to handle this
    @location = Location.find_by_zip params[:id]
    if @location.nil?
      @location = Location.find params[:id]
    end
  end
end
