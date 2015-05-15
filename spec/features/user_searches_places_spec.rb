require 'rails_helper'

feature 'A user searches places' do
  scenario 'and views matching places' do
    create_list(:place, 5, :active, name: 'Playmoweb')
    create_list(:place, 2, :active, name: 'Craftsmen')

    visit places_path
    fill_in 'search', with: 'craftsmen'
    click_button 'Chercher'

    expect(page).to have_content('Craftsmen', count: 2)
  end

  scenario 'and has search input already filled in when url parameter given' do
    visit places_path(q: 'craftsmen')

    expect(find_field('search').value).to eq('craftsmen')
  end

  scenario 'and can navigate between pages keeping his search query' do
    create_list(:place, 30, :active, name: 'Craftsmen')

    visit places_path(q: 'craftsmen')
    click_link('Suivante')

    expect(page).to have_content('Craftsmen', count: 10)
  end
end
