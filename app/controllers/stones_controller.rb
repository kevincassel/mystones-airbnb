class StonesController < ApplicationController

  def index
    @stones = Stone.all
 end

  def show
    @stone = Stone.find(params[:id])
  end
  
end
