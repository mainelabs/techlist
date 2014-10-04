FactoryGirl.define do
  factory :place do
    name 'Craftsmen Angers'
    kind Kind.codes.first
    state :pending
    latitude 48.8724029
    longitude 2.7768103
    street '25 rue Lenepveu'
    zip_code '49100'
    city 'Angers'
    url 'http://craftsmen.io'
    logo_url 'https://pbs.twimg.com/profile_images/425256684244566016/N0wcdLyQ_400x400.jpeg'
    twitter_name 'craftsmenhq'
    description 'This could be a long description'
    owner_name 'Sébastien Charrier'
    owner_email 'sebastien@craftsmen.io'

    trait :active do
      state :active
    end
  end
end
