class AddUseridToTimeline < ActiveRecord::Migration[5.2]
  def change
    Timeline.delete_all
    add_reference :timelines, :user, null: false, foreign_key: true
  end
end
