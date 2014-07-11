class PlaceSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :kind,
              :address,
              :zip_code,
              :city,
              :url,
              :description,
              :owner_name,
              :owner_email,
              :created_at,
              :updated_at
end
