require 'rails_helper'

feature 'An admin rejects a place update' do
  scenario "not pending place updates don't have the reject link" do
    active = create(:place_update, :in_angers, :active)
    login_as(create(:admin))

    visit rails_admin.edit_path(model_name: 'PlaceUpdate', id: active.id)

    expect(page).to_not have_link(t('admin.actions.reject_update.menu'))
  end

  scenario 'pending place updates have the reject link' do
    pending = create(:place_update, :in_angers)
    login_as(create(:admin))

    visit rails_admin.edit_path(model_name: 'PlaceUpdate', id: pending.id)

    expect(page).to have_link(t('admin.actions.reject_update.menu'))
  end

  scenario 'rejects the update' do
    pending = create(:place_update, :in_angers)
    login_as(create(:admin))

    visit rails_admin.edit_path(model_name: 'PlaceUpdate', id: pending.id)
    click_link(t('admin.actions.reject_update.menu'))

    pending.reload
    expect(pending).to be_rejected
  end
end
