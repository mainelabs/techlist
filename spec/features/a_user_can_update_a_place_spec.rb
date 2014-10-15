require 'rails_helper'

feature 'A user updates a place' do
  scenario 'original values are displayed' do
    place = create(:place, :in_angers_with_coordinates, :active)

    visit edit_place_path(place)

    expect(find_field(t('simple_form.labels.place.name')).value).to eq(place.name)
  end

  scenario 'fills all required fields' do
    place = create(:place, :in_angers_with_coordinates, :active)

    visit edit_place_path(place)
    fill_in t('simple_form.labels.place.name'), with: 'Updated place name'
    fill_in t('simple_form.labels.place.owner_name'), with: place.owner_name
    fill_in t('simple_form.labels.place.owner_email'), with: place.owner_email
    click_button t('places.messages.update_the_place')

    place_update = PlaceUpdate.last
    expect(page).to have_content(t('places.messages.place_updated'))
    expect(place_update.place).to eq(place)
    expect(place_update.name).to eq('Updated place name')
    expect(place_update.state).to eq('pending')
  end

  scenario 'cannot update a pending place' do
    place = create(:place, :in_angers_with_coordinates)

    expect { visit edit_place_path(place) }.to raise_error
  end
end
