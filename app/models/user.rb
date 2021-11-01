class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
  has_many :followed, class_name: 'Follow', foreign_key: :followed_user_id, dependent: :destroy
  has_many :following, class_name: 'Follow', foreign_key: :follower_id
  has_many :following_users, through: :following, source: :followed_user

  def followed_by?(user)
    followed.find_by(follower_id: user.id).present?
  end
end
