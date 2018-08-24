class Character < ApplicationRecord
  has_many :avatars
  has_many :users, through: :avatars
  has_many :costumes, through: :avatars
end
