class AddIndexToUser < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :address, unique: true
  end
end
