class AddUserIdToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :user_id, :integer
    remove_column :users, :password
  end
end
