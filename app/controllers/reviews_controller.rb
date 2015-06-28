class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant.id
    if @review.save
      flash[:notice] = "Review created successfully."
      redirect_to restaurant_path(@restaurant.id)
    else
      # render :template => 'restaurants/show'
      render :new
    end
  end

 protected
  def review_params
    params.require(:review).permit(:rating, :review)
  end
end