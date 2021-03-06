TripPlanner::Application.routes.draw do
  get "trips/new"

  authenticated :user do
    root :to => 'trips#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :trips
end