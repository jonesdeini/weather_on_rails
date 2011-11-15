require 'net/http'
require 'rexml/document'

class HomeController < ApplicationController

  def index
    #split_up_zipcodes
  end

def split_up_zipcodes
  file = File.new('zipcodes')
  strings = file.first.split("\" \"")
  strings.each{|str| str.chomp!}
  strings.each{|str| get_the_info str }
end

def get_the_info(string)
  url = "http://xml.weather.yahoo.com/forecastrss?p=" + string + "&u=f"
  xml_data = Net::HTTP.get_response(URI.parse(url)).body
  @doc = REXML::Document.new(xml_data)
  attribz = ["city","region"]
  element = "rss/channel/yweather:location"
  @location = info_getter(element, attribz)
  attribz = ["text","code", "temp","date" ]
  element = "rss/channel/item/yweather:condition"
  @weather = info_getter(element, attribz)
end

  def info_getter(element, attrib_array)
    out = "" 
    @doc.elements.each(element) do |ele|
      attrib_array.each{|attrib|
        out += ele.attributes[attrib] + " "}   
      end
   return out
  end

end
