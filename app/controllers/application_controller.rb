class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_places_count

  private

  def set_places_count
    @places_count = Place.displayable.count
  end
end
