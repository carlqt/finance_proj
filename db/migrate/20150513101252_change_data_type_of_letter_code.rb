class ChangeDataTypeOfLetterCode < ActiveRecord::Migration
  def change
    change_column :forms, :letter_code, :string
  end
end
