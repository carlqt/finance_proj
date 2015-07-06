require 'rails_helper'

feature "Form create", js: true do
  background { sign_in_as user.username }
  let!(:user) { create :user }

  context 'With PO' do
    scenario "saves a form created" do

      visit new_with_po_path
      fill_in 'with_po_requestor', with: "carl tablante"
      fill_in 'with_po_company_name', with: "Aureso"
      fill_in 'with_po_supplier', with: "Headstrong"
      fill_in 'with_po_secretary', with: "Anne Rejaba"
      fill_in 'with_po_engineer', with: "Gerald Pasion"
      fill_in 'with_po_jo', with: 4
      fill_in 'with_po_page', with: 4
      fill_in 'with_po_total_amount', with: '55.00'

      find(".add_fields").click
      description = all(".fields input")[0]
      quantity = all(".fields input")[1]
      description.set "test item"
      quantity.set 10

      click_button 'Save'

      visit with_pos_path
      record = find('tbody tr').text
      expect(record).to have_content 'pending'
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

      find(".add_fields").click
      description = all(".fields input")[0]
      quantity = all(".fields input")[1]
      description.set "test item"
      quantity.set 10

      click_button 'Submit'

      visit with_pos_path
      record = find('tbody tr').text
      expect(record).to have_content 'submitted'
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

      find(".add_fields").click
      description = all(".fields input")[0]
      quantity = all(".fields input")[1]
      description.set "test item"
      quantity.set 10

      click_button 'Save'

      visit without_pos_path
      record = find('tbody tr').text
      expect(record).to have_content 'pending'
    end

    scenario "submits a form created" do
      visit new_without_po_path
      fill_in 'without_po_requestor', with: "carl tablante"
      fill_in 'without_po_company_name', with: "Aureso"
      fill_in 'without_po_secretary', with: "Anne Rejaba"
      fill_in 'without_po_supplier', with: "Gerald Pasion"
      fill_in 'without_po_transaction_number', with: 4
      fill_in 'without_po_total_amount', with: '55.00'

      find(".add_fields").click
      description = all(".fields input")[0]
      quantity = all(".fields input")[1]
      description.set "test item"
      quantity.set 10

      click_button 'Submit'

      visit without_pos_path
      record = find('tbody tr').text
      expect(record).to have_content 'submitted'
    end
  end
end