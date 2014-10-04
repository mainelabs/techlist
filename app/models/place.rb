class Place < ActiveRecord::Base
  KINDS = Kind.codes

  validates :name, presence: true
  validates :state, presence: true
  validates :kind, presence: true, inclusion: { in: KINDS }
  validates :lat, presence: true, numericality: true
  validates :lon, presence: true, numericality: true

  include AASM
  aasm column: 'state' do
    state :pending, initial: true
    state :active
    state :rejected

    event :accept do
      transitions from: :pending, to: :active
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end
  end

  rails_admin do
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
      field :address
      field :zip_code
      field :city
      field :lat
      field :lon
      field :url
      field :twitter_name
      field :logo_url
      field :description
      field :owner_name
      field :owner_email
    end
  end

  def kind_enum
    KINDS
  end

  def state_enum
    aasm.states
  end
end
