require 'rails_helper'

describe Search, type: :model do
  it { should validate_presence_of(:page_title) }
  it { should validate_presence_of(:results_one) }
  it { should validate_presence_of(:results_other) }
  it { should validate_presence_of(:slug) }
end
