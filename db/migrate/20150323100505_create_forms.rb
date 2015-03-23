class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.integer :letter_code
      t.string :requestor
      t.string :secretary
      t.string :payment_type
      t.string :company_name
      t.decimal :total_amount
      t.string :supplier

      t.timestamps null: false
    end
  end
end
