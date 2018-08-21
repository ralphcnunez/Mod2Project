class Avatar < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :costume

  # def image
  #   case self.character_id == 1 &&  self.costume_id == 1
  #     self.img_url = rails.png



end
