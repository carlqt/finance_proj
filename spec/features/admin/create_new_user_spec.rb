require 'rails_helper'

feature "Admin" do
  let(:admin) { create :user }
  before { sign_in_as admin.username }

  scenario "creates a new user of type secretary" do
    visit new_admin_path
    fill_in "user_username", with: "carlqt"
    fill_in "user_password", with: "password"
    select "Secretary", from: "user_type"
    click_button "Create"
    expect(page).to have_content "New user created"
  end

  scenario "creates a new user of type admin" do
    visit new_admin_path
    fill_in "user_username", with: "carlqt"
    fill_in "user_password", with: "password"
    select "Admin", from: "user_type"
    click_button "Create"
    expect(page).to have_content "New user created"
  end
end