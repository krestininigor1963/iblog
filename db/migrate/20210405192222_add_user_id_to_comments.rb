class AddUserIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_id, :integer, default: 1
    add_index :comments, [:id, :created_at]
  end
end
