class Avatar < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :costume

  # def image
  #   case self.character_id == 1 &&  self.costume_id == 1
  #     self.img_url = rails.png


  def self.most_liked
     counter = 0
     answer = []
     all.each do |avatar|
       if avatar.likes > counter
         answer << avatar.name
      end
    end
    answer
  end


end
