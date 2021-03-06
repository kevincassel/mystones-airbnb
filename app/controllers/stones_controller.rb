class StonesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @stones = Stone.all
      @markers = @stones.geocoded.map do |stone|
      {
      lat: stone.latitude,
      lng: stone.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { stone: stone })
      }
    end
    if params[:query].present?
      sql_query = " \
      stones.name @@ :query \
      OR stones.town @@ :query \
      "
      @stones = Stone.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @stones = Stone.all
    end
  end

  def show
    @stone = Stone.find(params[:id])
    @marker = [{ lat: @stone.latitude, lng: @stone.longitude }]  
    @booking = Booking.new
  end

  def new
    @stone = Stone.new
  end

  def create
    @stone = Stone.new(stone_params)
    @stone.user = current_user
      if @stone.save
        redirect_to @stone
      else
        render :new
      end
  end

  def edit
    @stone = Stone.find(params[:id])
  end

  def update
    @stone = Stone.find(params[:id])
    @stone.update(stone_params)
    redirect_to stone_path(@stone)
  end

  def destroy
    @stone = Stone.find(params[:id])
    @stone.destroy
    redirect_to stones_path
  end

  private

  def stone_params
    params.require(:stone).permit(:name, :category, :age, :weight, :gender, :price, :address, :zip, :town, :description, :size, :country, :sensation, photos: [])
  end

end
