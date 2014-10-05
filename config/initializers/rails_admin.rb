RailsAdmin.config do |config|
  config.model Place do
    list do
      filters [:state, :kind]
      field :state
      field :kind
      field :name
      field :url
      field :owner_email
    end

    edit do
      field :name
      field :kind
      field :state
      field :street
      field :zip_code
      field :city
      field :country_code
      field :latitude
      field :longitude
      field :url
      field :twitter_name
      field :logo_url
      field :description
      field :owner_name
      field :owner_email
    end
  end
end
