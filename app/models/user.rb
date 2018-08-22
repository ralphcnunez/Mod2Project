class User < ApplicationRecord
  has_many :avatars
  has_many :characters, through: :avatars
  has_many :costumes, through: :avatars
  has_many :posts, through: :avatar
end
