class ChangeColumnImportance < ActiveRecord::Migration[5.1]
  def change
    #NOT NULL制約を追加
    change_column_null :tasks, :importance, false

    #default値を1に設定
    change_column_default :tasks, :importance, 1
  end
end
