class HomeController < ApplicationController
  def index
    @latest = Place.latest
    @random = Place.random
    @places_by_kind = Place.count_by_kind
  end
end
