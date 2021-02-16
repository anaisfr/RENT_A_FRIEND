class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @booking.friend = Friend.find(params[:friend_id])
    @booking.user = current_user
    @friend = @booking.friend
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.friend = Friend.find(params[:friend_id])
    @friend = @booking.friend
    @booking.user = current_user
    @booking.save
    redirect_to root_path
  end

  def accepted
    @booking = Booking.find(params[:id])
    @friend = Friend.find(params[:friend_id])
    @booking.friend = @friend
    @booking.user = current_user
    @booking.status = "accepted"
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
