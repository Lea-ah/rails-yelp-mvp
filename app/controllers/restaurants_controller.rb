class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  # A visitor can see the list of all restaurants.
  def index
    @restaurants = Restaurant.all
    @restaurant = Restaurant.new
  end

  # A visitor can see the details of a restaurant, with all the reviews related to the restaurant.
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # A visitor can add a new restaurant, and be redirected to the show view of that new restaurant.
  def new
    @restaurant = Restaurant.new
  end

  # A visitor can add a new review to a restaurantIn our MVP, a visitor cannot update / delete any restaurant or review.
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end
  # This is the role of the admin (i.e. you) - as a developer you have the power to manipulate the DB from the rails console if you want to update / delete any record.

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
