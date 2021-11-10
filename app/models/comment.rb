class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  belongs_to :timeline
  belongs_to :user
end
