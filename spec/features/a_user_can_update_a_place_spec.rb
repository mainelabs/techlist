require 'rails_helper'

feature 'A user updates a place' do
  scenario 'original values are displayed' do
    place = create(:place, :in_angers_with_coordinates)

    visit edit_place_path(place)

    expect(find_field('Place name').value).to eq(place.name)
  end

  scenario 'fills all required fields' do
    place = create(:place, :in_angers_with_coordinates)

    visit edit_place_path(place)
    fill_in 'Place name', with: 'Updated place name'
    fill_in 'Your name', with: place.owner_name
    fill_in 'Your emai', with: place.owner_email
    click_button 'Update the place'

    place_update = PlaceUpdate.last
    expect(page).to have_content('Your place update has correctly been saved')
    expect(place_update.place).to eq(place)
    expect(place_update.name).to eq('Updated place name')
    expect(place_update.state).to eq('pending')
  end
end
