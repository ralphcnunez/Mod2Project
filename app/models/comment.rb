class Comment < ApplicationRecord
  belongs_to :avatar
  belongs_to :user
end
