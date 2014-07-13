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
              :description,
              :owner_name,
              :owner_email,
              :created_at,
              :updated_at

  def coordinates
    [object.lat, object.lon]
  end
end
