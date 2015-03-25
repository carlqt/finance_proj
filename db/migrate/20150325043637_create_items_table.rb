class CreateItemsTable < ActiveRecord::Migration
  def change
    create_table :items_tables do |t|
      t.integer :itemable_id
      t.string :itemable_type

      t.timestamps null: false
    end
  end
end
