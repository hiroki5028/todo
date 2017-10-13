class AddColumnToTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :category_id, :integer
  end
end
