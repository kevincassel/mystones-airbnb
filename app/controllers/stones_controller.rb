class StonesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @stones = Stone.all
 end

  def show
    @stone = Stone.find(params[:id])
  end
  
  def new
    @stone = Stone.new
  end

  def create

  end

end
