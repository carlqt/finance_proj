require 'rails_helper'

feature "Pending " do
  before { sign_in_as admin.username }
  let(:admin) { create :user }
  let(:po) { create :without_po, status: 'submitted' }
  scenario "can approve pending forms" do
    visit without_po_path(po)
    click_link "Approve"
    expect(page).to have_content "Form has been approved"
  end

  scenario "can reject pending forms" do
    visit without_po_path(po)
    click_link "Reject"
    expect(page).to have_content "Form has been rejected"
  end
end