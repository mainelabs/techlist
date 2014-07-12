# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place do
    name "Craftsmen Angers"
    kind Place::KINDS.first
    state :pending
    address "25 rue Lenepveu"
    zip_code "49100"
    city "Angers"
    url "http://craftsmen.io"
    description "This could be a long description"
    owner_name "Sébastien Charrier"
    owner_email "sebastien@craftsmen.io"

    trait :active do
      state :active
    end
  end
end
