FactoryGirl.define do
  factory :place_update do
    association :place, factory: [:place, :in_angers_with_coordinates]
    name 'Craftsmen Angers'
    kind Kind.codes.first
    state :pending
    url 'http://craftsmen.io'
    logo_url 'https://pbs.twimg.com/profile_images/425256684244566016/N0wcdLyQ_400x400.jpeg'
    twitter_name 'craftsmenhq'
    description 'This could be a long description.'
    owner_name 'Sébastien Charrier'
    owner_email 'sebastien@craftsmen.io'
    in_angers

    trait :in_angers do
      street '25 rue Lenepveu'
      city 'Angers'
      zip_code '49100'
    end

    trait :active do
      state :active
    end
  end
end
