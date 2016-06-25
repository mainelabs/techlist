require 'rails_helper'

feature 'A user edits a place' do
  scenario 'by filling all the required fields' do
    place = create(:place, :active, kind: 'company')

    visit edit_place_path(place)
    fill_in 'Nom', with: 'Updated'
    select t('kinds.codes.incubator'), from: 'Type'
    fill_in 'Description', with: 'Updated'
    fill_in 'Numéro et rue', with: 'Updated'
    fill_in 'Code postal', with: 'Updated'
    fill_in 'Ville', with: 'Updated'
    fill_in 'Votre nom', with: 'Updated'
    fill_in 'Votre adresse email', with: 'Updated'
    click_button 'Mettre à jour le lieu'

    expect(page).to have_content('a été correctement sauvegardé')
  end

  scenario 'omitting some required fields' do
    place = create(:place, :active, kind: 'company')

    visit edit_place_path(place)
    click_button 'Mettre à jour le lieu'

    expect(page).to have_content(t('simple_form.error_notification.default_message'))
  end

  scenario 'cancelling the update and going back to the place page' do
    place = create(:place, :active, kind: 'company')

    visit edit_place_path(place)
    click_link 'annuler'

    expect(current_path).to eq(place_path(place))
  end

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
