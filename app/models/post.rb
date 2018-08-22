class Post < ApplicationRecord
  belongs_to :avatar
  belongs_to :user through: :avatar
end
