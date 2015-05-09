class HomeController < ApplicationController
  def index
    @latest = Place.latest
    @random = Place.random
  end
end
