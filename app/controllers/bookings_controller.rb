class BookingsController < ApplicationController


  def create
    @stone = Stone.find(params[:stone_id])
    @booking = Booking.new
    @booking.user = current_user
    @booking.stone = @stone
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end
end
