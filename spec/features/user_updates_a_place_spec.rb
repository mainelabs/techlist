require 'rails_helper'

feature 'A user updates a place' do
  scenario 'and views fields already filled with original values' do
    place = create(:place, :active)

    visit edit_place_path(place)

    expect(find_field('Nom').value).to eq(place.name)
    expect(page).to have_css("meta[name='robots'][content='noindex']", visible: false)
  end

  scenario 'and fills all required fields' do
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

  scenario 'but not pending ones' do
    place = create(:place)

    expect { visit edit_place_path(place) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
