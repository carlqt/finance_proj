class AddUserIdToPoForms < ActiveRecord::Migration
  def change
    add_column :without_pos, :user_id, :integer
    add_column :with_pos, :user_id, :integer
  end
end
