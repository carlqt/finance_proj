class CreateWithPos < ActiveRecord::Migration
  def change
    create_table :with_pos do |t|
      t.string :engineer
      t.integer :po
      t.integer :jo
      t.integer :page

      t.timestamps null: false
    end
  end
end
