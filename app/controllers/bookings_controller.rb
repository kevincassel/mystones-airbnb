class BookingsController < ApplicationController

  def new
    @stone = Stone.find(params[:stone_id])
    @booking = Booking.new
  end

  def create
    @stone = Stone.find(params[:stone_id])
    @booking = Booking.new
    @booking.user = current_user
    @booking.stone = @stone
    if @booking.save
      redirect_to stone_path(@stone)
    else
      render :new
    end
  end
end
