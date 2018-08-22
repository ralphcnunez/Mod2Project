class Avatar < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :costume
  has_many :posts



  def image
    if self.character_id == 1 && self.costume_id == 1
       "mario_summer.png"
    elsif self.character_id == 1 && self.costume_id == 2
      "mario_winter.jpg"
    elsif self.character_id == 1 && self.costume_id == 3
      "mario_halloween.jpeg"
    elsif self.character_id == 1 && self.costume_id == 4
      "street_mario.jpg"
    elsif self.character_id == 2 && self.costume_id == 1
      "princess_peach_summer.png"
    elsif self.character_id == 2 && self.costume_id == 2
      "princess_peach_winter.png"
    elsif self.character_id == 2 && self.costume_id == 3
      "princess_peach.png"
    elsif self.character_id == 2 && self.costume_id == 4
      "street_peach.jpg"
    end
  end

  def user_avatars_id
    @avatars = self.user.avatars.map(&:id)
  end

    def next_avatar
      current_index = user_avatars_id.index(self.id)
      if self.user.avatars[current_index + 1]
        @avatar = self.user.avatars[current_index + 1]
      else
        @avatar = self.user.avatars[current_index]
      end
    end

  # def next_user_id
  #   avatar_count = self.user.avatars.count
  #   if self.id < avatar_count
  #     @avatar = self.id + 1
  #   else
  #     @avatar = self.id
  #   end
  # end

  def previous_avatar
    current_index = user_avatars_id.index(self.id)
    if current_index > 0
      @avatar = self.user.avatars[current_index - 1]
    else
      @avatar = self.user.avatars[current_index]
    end
  end


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
