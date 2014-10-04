class PlaceSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :kind,
              :state,
              :address,
              :zip_code,
              :city,
              :latitude,
              :longitude,
              :url,
              :logo_url,
              :description,
              :twitter_name,
              :created_at,
              :updated_at
end
