require 'rails_helper'

feature 'A user add a place' do
  scenario 'fills all the required fields' do
    Place.geocoding_service = double('geocoding service', coordinates: nil)

    visit new_place_path
    fill_in 'Place name', with: 'Craftsmen'
    select 'Company', from: 'Type'
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
