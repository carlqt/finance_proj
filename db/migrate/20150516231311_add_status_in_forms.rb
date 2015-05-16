class AddStatusInForms < ActiveRecord::Migration
  def change
    add_column :forms, :status, :string, default: "pending"
  end
end
