class User < ApplicationRecord
  has_many :avatars
  has_many :characters, through: :avatars
  has_many :costumes, through: :avatars
  has_many :comments
  has_secure_password

  validates :username, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 3}
  validates :img_url, presence: true
  validates :name, presence: true
end
