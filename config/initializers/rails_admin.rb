RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.authorize_with do
    redirect_to '/' unless current_user.admin?
  end

  config.current_user_method(&:current_user)

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
      field :kind, :enum do
        enum do
          Kind.codes
        end
      end
      field :state, :enum do
        enum do
          Place.aasm.states.map(&:name)
        end
      end
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

  config.model PlaceUpdate do
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
      field :kind, :enum do
        enum do
          Kind.codes
        end
      end
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

  config.model User do
    list do
      field :id
      field :email
      field :last_sign_in_at
    end

    edit do
      field :email
      field :password
      field :password_confirmation
      field :admin
    end
  end
end
