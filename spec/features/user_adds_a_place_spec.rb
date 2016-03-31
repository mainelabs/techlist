require 'rails_helper'

feature 'A user adds a place' do
  scenario 'by filling all the required fields' do
    place = build(:place)
    Place.geocoding_service = double('geocoding service', coordinates: nil)

    visit new_place_path
    fill_in 'Nom', with: place.name
    select t('kinds.codes.school'), from: 'Type'
    fill_in 'Description', with: place.description
    fill_in 'Numéro et rue', with: place.street
    fill_in 'Code postal', with: place.zip_code
    fill_in 'Ville', with: place.city
    fill_in 'Votre nom', with: place.owner_name
    fill_in 'Votre adresse email', with: place.owner_email
    click_button 'Ajouter le lieu'

    expect(page).to have_content('a été correctement sauvegardé')
  end

  scenario 'omitting some required fields' do
    Place.geocoding_service = double('geocoding service', coordinates: nil)

    visit new_place_path
    click_button 'Ajouter le lieu'

    expect(page).to have_content(t('simple_form.error_notification.default_message'))
  end

  scenario 'changind his mind and returning to the list' do
    visit new_place_path
    click_link 'revenir à la liste'

    expect(current_path).to eq(places_path)
  end
end
