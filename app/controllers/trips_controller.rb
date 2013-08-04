class TripsController < ApplicationController
  #before_action :user_signed_in?, only: [:create, :destroy]
  
  def index
    @trips = current_user.trips.paginate(page: params[:page])
  end

  def show
    @trip = Trip.find(params[:id]) 
  end

  def new
    @trip = Trip.new(params[:trip])
  end

  def create
    @trip = current_user.trips.build(params[:trip])
    if @trip.save
      flash[:sucess]= "New Trip created"
      redirect_to trips_path
    else
      render root_url
    end
  end

  def destroy
    
  end
end
