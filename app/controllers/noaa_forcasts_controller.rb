class NoaaForcastsController < ApplicationController
  def index
    #@forcast = NoaaForcast.find_by_noaa_location_id params[:noaa_location_id]
    @forcast = NoaaForcast.all :conditions => {:noaa_location_id => params[:noaa_location_id]}
  end
end
