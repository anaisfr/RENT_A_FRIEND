class FriendsController < ApplicationController
  before_action :set_friend, only: [:show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @friends = Friend.all

    if params[:query] != ""
      sql_query = " \
        friends.first_name ILIKE :query \
        OR friends.last_name ILIKE :query \
        OR friends.city ILIKE :query \
      "
      @friends = @friends.where(sql_query, query: "%#{params[:query]}%")

    elsif params[:gender] != "gender"
      params[:gender]
      @friends = @friends.where(gender: params[:gender])

      if params[:age] != "age"
        array = params[:age].split(",")
        age_start = array[0]
        age_end = array[1]
        sql_query = " \
          friends.age BETWEEN :start AND :end
        "
        @friends = @friends.where(sql_query, start: age_start, end: age_end)

        if params[:price] != "price"
          array = params[:price].split(",")
          price_start = array[0]
          price_end = array[1]
          sql_query = " \
          friends.price BETWEEN :start AND :end
          "
          @friends = @friends.where(sql_query, start: price_start, end: price_end)
        end
      end
    else
      @friends = Friend.all
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @friend = Friend.new
    @friend.user = current_user
  end

  def create
    @friend = Friend.new(friends_params)
    @friend.user = current_user
    @friend.save
    redirect_to root_path
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friends_params
    params.require(:friend).permit(:first_name, :last_name, :age, :gender, :city, :price, :description, :photo)
  end
end
