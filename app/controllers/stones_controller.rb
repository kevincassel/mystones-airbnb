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
  end

  def show
    @stone = Stone.find(params[:id])
  end
  
end
