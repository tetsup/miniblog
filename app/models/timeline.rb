class Timeline < ApplicationRecord
  mount_uploader :attached_image_path, AttachedImageUploader
  validates :content, presence: true, length: { maximum: 140 }
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :comments_user, through: :comments, source: :user
  belongs_to :user

  scope :following, -> (user){ where(user: [user] + user.following_users) }
  scope :sorted, -> { order(id: :desc) }
end
