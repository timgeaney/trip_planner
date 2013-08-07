class TripsController < ApplicationController

  before_filter :authenticate_user!

  def index
    #@user = User.find(params[:user])
    #@trips = @user.trips.paginate(page: params[:page])
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

  def edit
    @trip = Trip.find(params[:id])  
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(params[:trip])
      flash[:sucess] = "Profile Updated"
      redirect_to @trip
    else
      render 'edit'
    end
  end
end
