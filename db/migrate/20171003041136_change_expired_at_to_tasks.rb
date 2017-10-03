class ChangeExpiredAtToTasks < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks, :expired_at, :datetime, null: false
  end
end
