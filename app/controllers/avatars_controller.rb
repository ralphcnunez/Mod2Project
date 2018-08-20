class AvatarsController < ApplicationController
  def index
    @avatars = Avatar.all
  end

  def show
    @avatar = Avatar.find(params[:id])
  end

  def new
    @avatar = Avatar.new
  end

  def create
    @avatar = Avatar.new(avatar_params)

    respond_to do |format|
      if @avatar.save
        format.html { redirect_to @avatar, notice: 'avatar was successfully created. You are one step closer to maximazing profits!' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @avatar = Avatar.find(params[:id])

  end


  private

    def avatar_params
      params.require(:avatar).permit()
    end
end
