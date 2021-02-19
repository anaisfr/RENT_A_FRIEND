class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @bookings = Booking.all
    @pending_bookings = Booking.joins(:friend).where(status: "pending", friends: { user: current_user })
    @accepted_bookings = Booking.joins(:friend).where(status: "accepted", friends: { user: current_user })
    @denied_bookings = Booking.joins(:friend).where(status: "denied", friends: { user: current_user })
    # @pending_bookings = current_user.friends.map {|friend| friend.bookings.where(status: "pending") }.flatten
    # @accepted_bookings = current_user.friends.map {|friend| friend.bookings.where(status: "accepted") }.flatten
    # @denied_bookings = current_user.friends.map {|friend| friend.bookings.where(status: "denied") }.flatten
    @friends = Friend.all
    @renter_bookings_pending = Booking.where(user: current_user, status: "pending")
    @renter_bookings_accepted = Booking.where(user: current_user, status: "accepted")
    @renter_bookings_denied = Booking.where(user: current_user, status: "denied")
  end
end
