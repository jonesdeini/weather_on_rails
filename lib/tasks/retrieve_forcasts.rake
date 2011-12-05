namespace :db do
  desc "Generate forcast records"
  task :retrieve_forcasts => :environment do
    require 'net/http'
    require 'rexml/document'
    retrieve_forcast
  end

  def retrieve_forcast
    NoaaLocation.all.each{|location|
      xml_data = Net::HTTP.get_response(URI.parse(location.xml_url)).body
      @doc = REXML::Document.new(xml_data)
      new_forcast = NoaaForcast.new(
        :observation_time => @doc.elements.first("current_observation/observation_time").text,
        :weather => @doc.elements.first("current_observation/weather").text,
        :temp_f => @doc.elements.first("current_observation/temp_f").text.to_s,
        :relative_humidity => @doc.elements.first("current_observation/relative_humidity").text,
        :wind_dir => @doc.elements.first("current_observation/wind_dir").text.to_s,
        :wind_degrees => @doc.elements.first("current_observation/wind_degrees").text.to_s,
        :wind_mph => @doc.elements.first("current_observation/wind_mph").text.to_s,
        :wind_gust_mph => @doc.elements.first("current_observation/wind_gust_mph").text.to_s,
        :pressure_mb => @doc.elements.first("current_observation/pressure_mb").text.to_s,
        :dewpoint_f => @doc.elements.first("current_observation/dewpoint_f").text.to_s,
        :windchill_f => @doc.elements.first("current_observation/windchill_f").text.to_s,
        :visibility_mi => @doc.elements.first("current_observation/visibility_mi").text.to_s
      )
      new_forcast.save and puts "."

    }
  end
end
