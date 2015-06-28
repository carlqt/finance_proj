require 'rails_helper'

feature "Form create" do
  before { login_as user, scope: :user }
  let(:user) { create :user }

  context 'With PO' do
    scenario "saves a form created" do
      visit new_with_po_path
      fill_in 'with_po_requestor', with: "carl tablante"
      fill_in 'with_po_company_name', with: "Aureso"
      fill_in 'with_po_secretary', with: "Anne Rejaba"
      fill_in 'with_po_supplier', with: "Headstrong"
      fill_in 'with_po_engineer', with: "Gerald Pasion"
      fill_in 'with_po_jo', with: 4
      fill_in 'with_po_page', with: 4
      fill_in 'with_po_total_amount', with: '55.00'
      click_button 'Save'

      visit with_pos_path
      record = find('tbody tr').text
      expect(record).to have_content 'pending'
      expect(user.with_pos.exists?).to be true
    end

    scenario "submits a form created" do
      visit new_with_po_path
      fill_in 'with_po_requestor', with: "carl tablante"
      fill_in 'with_po_company_name', with: "Aureso"
      fill_in 'with_po_supplier', with: "Headstrong"
      fill_in 'with_po_secretary', with: "Anne Rejaba"
      fill_in 'with_po_engineer', with: "Gerald Pasion"
      fill_in 'with_po_jo', with: 4
      fill_in 'with_po_page', with: 4
      fill_in 'with_po_total_amount', with: '55.00'
      click_button 'Submit'

      visit with_pos_path
      record = find('tbody tr').text
      expect(record).to have_content 'submitted'
      expect(user.with_pos.exists?).to be true
    end
  end

  context 'Without PO' do
    scenario "saves a form created" do
      visit new_without_po_path
      fill_in 'without_po_requestor', with: "carl tablante"
      fill_in 'without_po_company_name', with: "Aureso"
      fill_in 'without_po_secretary', with: "Anne Rejaba"
      fill_in 'without_po_supplier', with: "Gerald Pasion"
      fill_in 'without_po_transaction_number', with: 1
      fill_in 'without_po_total_amount', with: '55.00'
      click_button 'Save'

      visit without_pos_path
      record = find('tbody tr').text
      expect(record).to have_content 'pending'
      expect(user.without_pos.exists?).to be true
    end

    scenario "submits a form created" do
      visit new_without_po_path
      fill_in 'without_po_requestor', with: "carl tablante"
      fill_in 'without_po_company_name', with: "Aureso"
      fill_in 'without_po_secretary', with: "Anne Rejaba"
      fill_in 'without_po_supplier', with: "Gerald Pasion"
      fill_in 'without_po_transaction_number', with: 4
      fill_in 'without_po_total_amount', with: '55.00'
      click_button 'Submit'

      visit without_pos_path
      record = find('tbody tr').text
      expect(record).to have_content 'submitted'
      expect(user.without_pos.exists?).to be true
    end
  end
end