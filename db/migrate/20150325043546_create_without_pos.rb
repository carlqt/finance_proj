class CreateWithoutPos < ActiveRecord::Migration
  def change
    create_table :without_pos do |t|
      t.integer :transaction_id

      t.timestamps null: false
    end
  end
end
