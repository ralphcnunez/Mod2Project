class Comment < ApplicationRecord
  belongs_to :avatar
  has_one :user, :through => :avatar


end
