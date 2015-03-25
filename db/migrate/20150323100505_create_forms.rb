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
      t.integer :formable_id
      t.string :formable_type

      t.timestamps null: false
    end

    add_index :forms, :formable_id
  end
end
