require 'rails_helper'

feature 'A user add a place' do
  scenario 'fills all the required fields' do
    place = build(:place)
    Place.geocoding_service = double('geocoding service', coordinates: nil)

    visit new_place_path
    fill_in t('simple_form.labels.place.name'), with: place.name
    select t('kinds.codes.school'), from: t('simple_form.labels.place.kind')
    fill_in t('simple_form.labels.place.description'), with: place.description
    fill_in t('simple_form.labels.place.street'), with: place.street
    fill_in t('simple_form.labels.place.zip_code'), with: place.zip_code
    fill_in t('simple_form.labels.place.city'), with: place.city
    fill_in t('simple_form.labels.place.owner_name'), with: place.owner_name
    fill_in t('simple_form.labels.place.owner_email'), with: place.owner_email
    click_button t('places.messages.add_the_place')

    expect(page).to have_content(t('places.messages.place_created'))
  end

  scenario 'omit some required fields' do
    Place.geocoding_service = double('geocoding service', coordinates: nil)

    visit new_place_path
    click_button t('places.messages.add_the_place')

    expect(page).to have_content(t('simple_form.error_notification.default_message'))
  end
end
