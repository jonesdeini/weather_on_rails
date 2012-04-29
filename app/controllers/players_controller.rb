class PlayersController < ApplicationController
require 'xxl_scraper'

  def index
    @players = Player.all
  end 

  def create
    XXL_Scraper.scrape
    render :index
  end

end
