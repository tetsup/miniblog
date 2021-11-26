class ChangeNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:comments, :timeline_id, false)
    change_column_null(:comments, :user_id, false)
    change_column_null(:favorites, :user_id, false)
    change_column_null(:favorites, :timeline_id, false)
  end
end
