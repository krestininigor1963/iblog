class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :user_id, :integer, default: 1
    add_index :articles, [:id, :created_at]
  end

end
