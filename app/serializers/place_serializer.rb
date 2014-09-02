class PlaceSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :kind,
              :state,
              :coordinates,
              :address,
              :zip_code,
              :city,
              :url,
              :logo_url,
              :description,
              :twitter_name,
              :created_at,
              :updated_at

  def coordinates
    [object.lat, object.lon]
  end
end
