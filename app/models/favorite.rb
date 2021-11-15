class Favorite < ApplicationRecord
  validates :user_id, uniqueness: { scope: :timeline_id }
  belongs_to :user
  belongs_to :timeline

  scope :filter_by_date, -> (date){
    where(created_at: date.beginning_of_day..date.end_of_day)
  }
end
