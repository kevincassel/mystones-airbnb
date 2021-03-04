class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
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

end
