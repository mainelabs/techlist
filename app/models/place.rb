class Place < ActiveRecord::Base
  KINDS = ['startup', 'accelerator', 'incubator', 'coworking', 'investor', 'service']

  validates :name, presence: true
  validates :kind, presence: true, inclusion: { in: KINDS }

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
    edit do
      field :name
      field :kind
      field :address
      field :zip_code
      field :city
      field :url
      field :description
      field :owner_name
      field :owner_email
    end
  end

  def kind_enum
    KINDS
  end
end
