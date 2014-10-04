require 'spec_helper'

describe Place do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should allow_value(Kind.codes.first).for(:kind) }
    it { should_not allow_value(['Bar']).for(:kind) }
    it { should validate_presence_of(:latitude) }
    it { should validate_numericality_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_numericality_of(:longitude) }
  end
end
