class Costume < ApplicationRecord
  has_many :avatars
  has_many :users, through: :avatars
  has_many :characters, through: :avatars
end
