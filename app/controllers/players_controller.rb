class PlayersController < ApplicationController
require 'xxl_scraper'

  def index
    @players = Player.all
  end 

  def create
    Delayed::Job.enqueue XXL_Scraper.new
    render :index
  end

end
