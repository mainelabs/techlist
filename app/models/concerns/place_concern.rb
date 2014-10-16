module PlaceConcern
  extend ActiveSupport::Concern

  included do
      validates :name, presence: true
      validates :kind, presence: true, inclusion: { in: Kind.codes }
      validates :street, presence: true
      validates :zip_code, presence: true
      validates :city, presence: true
      validates :description, presence: true, on: :user_input
      validates :owner_name, presence: true, on: :user_input
      validates :owner_email, presence: true, on: :user_input

      def duplicable_attributes
        attributes.extract!(
          'name',
          'kind',
          'street',
          'zip_code',
          'city',
          'url',
          'description',
          'logo_url',
          'twitter_name'
        )
      end
  end
end
