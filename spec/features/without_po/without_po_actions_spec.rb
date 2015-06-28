require 'rails_helper'

feature "Without Po actions" do
  context "when admin" do
    let(:admin) { create :user }
    before { sign_in_as admin.username, 'password'}

    context "when status of form is 'submitted'" do
      let!(:po) { create :without_po, status: 'submitted' }
      scenario "available actions are View, Approve and Reject" do
        visit without_pos_path
        record = find("td .dropdown-menu")
        expect(record.text).to match /Approve|View|Reject/
      end
    end

    context "when status of form is 'pending'" do
      let!(:po) { create :without_po }
      scenario "available actions is View" do
        visit without_pos_path
        record = find("td .dropdown-menu")
        expect(record.text).to eq "View"
      end
    end

    context "when status of form is 'approved'" do
      let!(:po) { create :without_po, status: 'approved' }
      scenario "available actions is View" do
        visit without_pos_path
        record = find("td .dropdown-menu")
        expect(record.text).to eq "View"
      end
    end
  end

  context "when secretary" do
    let(:user) { create :user, :sec }
    before { sign_in_as user.username, 'password'}

    context "when status of form is 'submitted'" do
      let!(:po) { create :without_po, status: 'submitted' }
      scenario "available actions is View" do
        visit without_pos_path
        record = find("td .dropdown-menu")
        expect(record.text).to eq "View"
      end
    end

    context "when status of form is 'pending'" do
      let!(:po) { create :without_po }
      scenario "available actions are View and Edit" do
        visit without_pos_path
        record = find("td .dropdown-menu")
        expect(record.text).to match /Edit|View/
      end
    end

    context "when status of form is 'approved'" do
      let!(:po) { create :without_po, status: 'approved' }
      scenario "available actions is View" do
        visit without_pos_path
        record = find("td .dropdown-menu")
        expect(record.text).to eq "View"
      end
    end
  end

end