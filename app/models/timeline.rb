class Timeline < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  has_many :favorites, dependent: :destroy
  belongs_to :user

  scope :following, -> (user){ where(user: [user] + user.following_users) }
  scope :sorted, -> { order(created_at: :desc) }
  scope :favorites_count, -> {
    joins(:favorites).
    group(:id).
    count
  }
end
