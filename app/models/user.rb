class User < ApplicationRecord
  has_secure_password
  has_many :avatars
  has_many :characters, through: :avatars
  has_many :costumes, through: :avatars

end
