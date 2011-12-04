class NoaaLocationsController < ApplicationController

  def index
    @location = NoaaLocation.all
  end
end
