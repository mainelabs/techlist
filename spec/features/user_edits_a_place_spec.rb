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
    click_link 'revenir sur la page du lieu'

    expect(current_path).to eq(place_path(place))
  end
end
