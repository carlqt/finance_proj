class AddMoreColumnsToForm < ActiveRecord::Migration
  def change
    add_column :forms, :title, :string
    add_column :forms, :name_of_check, :string
    add_column :forms, :cv_number, :integer
  end
end
