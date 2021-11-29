class User < ApplicationRecord
  validates :username, {
    presence: true,
    length: { maximum: 20 },
    format: { with: /\A[a-zA-Z]+\z/ },
    uniqueness: true
  }
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  validates :profile, length: { maximum: 200 }
  has_many :timelines, dependent: :destroy
  has_many :followee_followingships, class_name: 'Follow', foreign_key: :followed_user_id, dependent: :destroy
  has_many :follower_followingships, class_name: 'Follow', foreign_key: :follower_id
  has_many :following_users, through: :follower_followingships, source: :followed_user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  def followed_by?(user)
    followee_followingships.find_by(follower_id: user.id).present?
  end
end
