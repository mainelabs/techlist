require 'rails_helper'

feature 'A user view the places Atom feed' do
  scenario 'there is a link to the map marker in the feed item description' do
    create(:place, :active)

    visit '/feed'

    expect(find(:xpath, '//feed/entry[1]/content').text).to include(t('feed.link_to_map_marker'))
  end

  scenario 'when several places exist, they have different "updated" times' do
    create(:place, :active, updated_at: 3.days.ago)
    create(:place, :active)

    visit '/feed'

    expect(find(:xpath, '//feed/entry[1]/updated').text).to_not eq(find(:xpath, '//feed/entry[2]/updated').text)
  end

  scenario 'when several places exist, they are ordered chronologically' do
    create(:place, :active, name: 'Newest place')
    create(:place, :active, name: 'Another place', updated_at: 3.days.ago)
    create(:place, :active, name: 'Oldest place', updated_at: 3.months.ago)

    visit '/feed'

    expect(find(:xpath, '//feed/entry[1]/title').text).to eq('Newest place')
    expect(find(:xpath, '//feed/entry[2]/title').text).to eq('Another place')
    expect(find(:xpath, '//feed/entry[3]/title').text).to eq('Oldest place')
  end
end
