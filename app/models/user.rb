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
end
