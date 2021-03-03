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
    @stone = Stone.new(stone_params)
    @stone = current_user
      if @stone.save
        redirect_to @stone
      else
        render :new
      end
  end

  private

  def stone_params
    params.require(:stone).permit(:name, :category, :age, :weight, :gender, :price, :address, :zip, :town, :description)
  end

end
