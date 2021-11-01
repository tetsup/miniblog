class Follow < ApplicationRecord
  validates :follower_id, uniqueness: { scope: :followed_user_id }
  belongs_to :followed_user, class_name: 'User'
end