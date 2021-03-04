class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user)
    @bookings_on_my_stones = current_user.stones.map {|stone| stone.bookings }.flatten
  end

  def create
    @stone = Stone.find(params[:stone_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.stone = @stone
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
