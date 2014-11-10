require 'rails_helper'

feature 'An admin accepts a new place' do
  scenario 'only on pending places' do
    active = create(:place, :in_angers_with_coordinates, :active)
    login_as(create(:admin))

    visit rails_admin.edit_path(model_name: 'Place', id: active.id)

    expect(page).to_not have_link(t('admin.actions.accept.menu'))
  end

  scenario 'by clicking on the accept link' do
    pending = create(:place, :in_angers_with_coordinates)
    login_as(create(:admin))

    visit rails_admin.edit_path(model_name: 'Place', id: pending.id)
    click_link(t('admin.actions.accept.menu'))

    pending.reload
    expect(pending).to be_active
  end
end
