class DropIdeas < ActiveRecord::Migration[5.1]
  def change
    drop_table :ideas
  end
end
