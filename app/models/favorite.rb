class Favorite < ApplicationRecord
  validates :user_id, uniqueness: { scope: :timeline_id }
  belongs_to :user
  belongs_to :timeline

  scope :filter_by_date, -> (date){
    where(created_at: date.beginning_of_day..date.end_of_day)
  }

  def self.get_favorites_rank(num, date)
    filter_by_date(date).
    group(:timeline_id).
    order('count(timeline_id) desc').
    limit(num).
    pluck(:timeline_id)
  end
end
