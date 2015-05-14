require 'rails_helper'

feature 'An admin accepts a new place' do
  scenario 'which has to be in pending state' do
    active = create(:place, :active)
    login_as(create(:admin))

    visit rails_admin.edit_path(model_name: 'Place', id: active.id)

    expect(page).to_not have_link(t('admin.actions.accept.menu'))
  end

  scenario 'by clicking on the accept link' do
    pending = create(:place)
    login_as(create(:admin))

    visit rails_admin.edit_path(model_name: 'Place', id: pending.id)
    click_link(t('admin.actions.accept.menu'))

    pending.reload
    expect(pending).to be_active
  end
end
