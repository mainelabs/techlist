require 'spec_helper'

describe Place do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should allow_value(Place::KINDS.first).for(:kind) }
    it { should_not allow_value(['Bar']).for(:kind) }
  end
end
