class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :expired_at
      t.integer :importance

      t.timestamps
    end
  end
end
