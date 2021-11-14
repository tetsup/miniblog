class AddTimelineImage < ActiveRecord::Migration[5.2]
  def change
    add_column :timelines, :attached_image_path, :string
  end
end
