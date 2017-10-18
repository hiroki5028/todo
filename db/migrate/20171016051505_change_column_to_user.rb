class ChangeColumnToUser < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :password, false

    change_column_default :users, :name, 'admin'

  end
end
