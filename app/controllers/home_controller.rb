class HomeController < ApplicationController
  def index
    @trips = current_user.trips.paginate(page: params[:page])
  end
end
