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
      t.integer :actable_id
      t.string :actable_type

      t.timestamps null: false
    end

    add_index :forms, :actable_id
  end
end
