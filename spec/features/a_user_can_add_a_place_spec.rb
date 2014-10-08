require 'rails_helper'

feature 'A user add a place' do
  scenario 'fills all the required fields' do
    place = build(:place)
    Place.geocoding_service = double('geocoding service', coordinates: nil)

    visit new_place_path
    fill_in 'Place name', with: place.name
    select place.kind.humanize, from: 'Type'
    fill_in 'Description', with: place.description
    fill_in 'Street', with: place.street
    fill_in 'Zip code', with: place.zip_code
    fill_in 'City', with: place.city
    fill_in 'Your name', with: place.owner_name
    fill_in 'Your email address', with: place.owner_email
    click_button 'Add the place'

    expect(page).to have_content('Your place has correctly been saved')
  end

  scenario 'omit some required fields' do
    Place.geocoding_service = double('geocoding service', coordinates: nil)

    visit new_place_path
    click_button 'Add the place'

    expect(page).to have_content('Please review the problems below')
  end
end
