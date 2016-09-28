FactoryGirl.define do
  factory :search do
    page_title 'Trouver une entreprise à Angers'
    page_description 'Les entreprises.'
    results_one 'Une entreprise'
    results_other '%{count} entreprises'
    slug 'entreprises-angers'
    q 'applications mobiles'
    kind 'company'
  end
end
