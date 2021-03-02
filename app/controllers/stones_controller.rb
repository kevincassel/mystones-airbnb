class StonesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @stones = Stone.all
 end

  def show
    @stone = Stone.find(params[:id])
  end
  
end
