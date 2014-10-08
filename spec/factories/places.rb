FactoryGirl.define do
  factory :place do
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
      country_code 'FR'
    end

    trait :in_angers_with_coordinates do
      in_angers
      latitude 48.8724029
      longitude 2.7768103
    end

    trait :active do
      state :active
    end

    factory :place_update do
    end
  end
end
