class BookingsController < ApplicationController
  before_action :set_friend_user_for_booking, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to root_path
  end

  private

  def set_friend_user_for_booking
    @booking.friend = Friend.find(params[:friend_id])
    @booking.user = current_user
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
