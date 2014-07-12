class Place < ActiveRecord::Base
  KINDS = ['startup', 'accelerator', 'incubator', 'coworking', 'investor', 'service']

  validates :name, presence: true
  validates :kind, presence: true, inclusion: { in: KINDS }

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
