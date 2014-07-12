require 'spec_helper'

describe Place do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should allow_value(Place::KINDS.first).for(:kind) }
    it { should_not allow_value(['Bar']).for(:kind) }
    it { should validate_presence_of(:lat) }
    it { should validate_numericality_of(:lat) }
    it { should validate_presence_of(:lon) }
    it { should validate_numericality_of(:lon) }
  end
end
