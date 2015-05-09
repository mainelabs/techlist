require 'rails_helper'

feature 'A user updates a place' do
  scenario 'original values are displayed' do
    place = create(:place, :active)

    visit edit_place_path(place)

    expect(find_field('Nom').value).to eq(place.name)
  end

  scenario 'fills all required fields' do
    place = create(:place, :active)

    visit edit_place_path(place)
    fill_in 'Nom', with: 'Updated place name'
    fill_in 'Votre nom', with: place.owner_name
    fill_in 'Votre adresse email', with: place.owner_email
    click_button 'Mettre à jour le lieu'

    place_update = PlaceUpdate.last
    expect(page).to have_content('a été correctement sauvegardée')
    expect(place_update.place).to eq(place)
    expect(place_update.name).to eq('Updated place name')
    expect(place_update.state).to eq('pending')
  end

  scenario 'cannot update a pending place' do
    place = create(:place)

    expect { visit edit_place_path(place) }.to raise_error
  end
end
