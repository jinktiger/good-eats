class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = 'restaurant added.'
      redirect_to '/restaurants'
    else
      render :new
    end
  end


  def index
    @restaurants = Restaurant.all.order(created_at: :desc)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new    #why do we need this here?
    @reviews = @restaurant.reviews
  end





  protected
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :city, :state, :zipcode, :category)
  end
end