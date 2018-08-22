class CostumesController < ApplicationController

  def index
    @costumes = Costume.all
  end

  def show
    @costume = Costume.find(params[:id])
  end

end
