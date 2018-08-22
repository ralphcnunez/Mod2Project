class Avatar < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :costume



  # def image
  #   if self.character_id == 1 && self.costume_id == 1
  #     "mariokart2.jpeg"
    # elsif self.character_id == 1 && self.costume_id == 1
    #   "img"
    # elsif self.character_id == 1 && self.costume_id == 1
    #   "img"
    # elsif self.character_id == 1 && self.costume_id == 1
    #   "img"
    # elsif self.character_id == 1 && self.costume_id == 1
    #   "img"
    # elsif self.character_id == 1 && self.costume_id == 1
    #   "img"
    # elsif self.character_id == 1 && self.costume_id == 1
    #   "img"
    # elsif self.character_id == 1 && self.costume_id == 1
    #   "img"
    # elsif self.character_id == 1 && self.costume_id == 1
    #   "img"
    # elsif self.character_id == 1 && self.costume_id == 1
    #   "img"
    # elsif self.character_id == 1 && self.costume_id == 1
    #   "img"
  #   end
  # end

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
