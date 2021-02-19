class ReviewsController < ApplicationController
  def new
    @review = Review.new
		@booking = Booking.find(params[:booking_id])
    @review.booking = Booking.find(params[:booking_id])
    @review.user = current_user
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    @booking = @review.booking
    @review.user = current_user
    @review.save
    redirect_to friend_path(@booking.friend)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
