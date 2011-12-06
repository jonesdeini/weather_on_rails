namespace :db do
  desc "Generate forcast records"
  task :retrieve_forcasts => :environment do
    require 'net/http'
    require 'rexml/document'
    retrieve_forcast
  end

  def retrieve_forcast
    NoaaLocation.all.each{|location|
      url = location.xml_url
      xml_data = Net::HTTP.get_response(URI.parse(url)).body
      if xml_data.include? "observation_time"
        @doc = REXML::Document.new(xml_data)
        if @doc.root.elements["weather"].nil?
            print "\n ", location.xml_url, " \n"
        end
        new_forcast = NoaaForcast.new(
          :observation_time => @doc.root.elements["observation_time"].text,
          :weather => @doc.root.elements["weather"] ? @doc.root.elements["weather"].text : "A Few Clouds",
          :temp_f => @doc.root.elements["temp_f"] ? @doc.root.elements["temp_f"].text : nil,
          :relative_humidity => @doc.root.elements["relative_humidity"] ? @doc.root.elements["relative_humidity"].text : nil,
          :wind_dir => @doc.root.elements["wind_dir"] ? @doc.root.elements["wind_dir"].text : nil,
          :wind_degrees => @doc.root.elements["wind_degrees"] ? @doc.root.elements["wind_degrees"].text : nil,
          :wind_mph => @doc.root.elements["wind_mph"] ? @doc.root.elements["wind_mph"].text : nil,
          :wind_gust_mph => @doc.root.elements["wind_gust_mph"] ? @doc.root.elements["wind_gust_mph"].text : nil,
          :pressure_mb => @doc.root.elements["pressure_mb"] ? @doc.root.elements["pressure_mb"].text : nil,
          :dewpoint_f => @doc.root.elements["dewpoint_f"] ? @doc.root.elements["dewpoint_f"].text : nil,
          :windchill_f => @doc.root.elements["windchill_f"] ? @doc.root.elements["windchill_f"].text : nil ,
          :visibility_mi => @doc.root.elements["visibility_mi"] ? @doc.root.elements["visibility_mi"].text : nil,
          :noaa_location_id => location.id
        )
        new_forcast.save and print "*"
      else
        print "."
      end
    }
  end
end
