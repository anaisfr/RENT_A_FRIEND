class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @bookings = Booking.where(user: current_user)
  end
end
