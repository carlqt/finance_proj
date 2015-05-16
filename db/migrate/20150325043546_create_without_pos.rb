class CreateWithoutPos < ActiveRecord::Migration
  def change
    create_table :without_pos do |t|
      t.integer :transaction_number

      t.timestamps null: false
    end
  end
end
