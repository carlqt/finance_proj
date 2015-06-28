require 'rails_helper'

feature "Status transmission" do
  context "when secretary" do
    context "when status of form is 'pending'" do
      let(:user) { create :user, :sec }
      before { sign_in_as user.username, 'password'}
      context "when saving and updating the form" do
        let!(:po) { create :without_po }
        scenario "user can edit the form" do
          visit without_pos_path
          record = all("td .dropdown-menu li a").first
          record.click
          fill_in "without_po_requestor", with: "Bruce Wayne"
          click_button "Save"
          record = all("tbody tr td")

          expect(record[2].text).to eq "Bruce Wayne"
          expect(record[9].text).to eq "pending"
        end
      end

      context "when submitting the form" do
        let!(:po) { create :without_po }
        scenario "the status of record changes from 'pending' to 'submitted'" do
          visit without_pos_path
          record = all("td .dropdown-menu li a")[2]
          record.click
          record = all("tbody tr td")

          expect(record[9].text).to eq "submitted"
        end
      end
    end
  end

  context "when admin" do
    let(:user) { create :user }
    before { sign_in_as user.username, 'password' }
    context "when status of form is 'submitted'" do
      let!(:po) { create :without_po, status: "submitted" }
      scenario "user can approve the form" do
        visit without_pos_path
        record = all("td .dropdown-menu li a")[1]
        record.click
        record = all("tbody tr td")

        expect(record[9].text).to eq "approved"
      end

      scenario "user can reject the form" do
        visit without_pos_path
        record = all("td .dropdown-menu li a")[2]
        record.click
        record = all("tbody tr td")

        expect(record[9].text).to eq "rejected"
      end
    end
  end
end