class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.integer :quantity
      t.integer :form_id
      t.string :name

      t.timestamps null: false
    end
  end
end
