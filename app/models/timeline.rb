class Timeline < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  belongs_to :user

  scope :following, -> (user){ where(user: [user] + [*user.following_users]) }
  scope :sorted, -> { order(created_at: :desc) }
end
