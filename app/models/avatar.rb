class Avatar < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :costume
end
