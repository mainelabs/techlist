require 'rails_helper'

feature 'A user add a place' do
  scenario 'fills all the required fields' do
    puts 'here'
    visit new_place_path
    exit(1)
    fill_in 'Name', with: 'Craftsmen'
    select 'Company', from: 'Type'
    click_button 'Add the place'

    save_and_open_page

    expect(page).to have_content('Ahahahaha. Impossible.')
  end
end
