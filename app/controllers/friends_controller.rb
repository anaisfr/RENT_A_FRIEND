class FriendsController < ApplicationController
  before_action :set_friend, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @friends = Friend.all
  end

  def show
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
    params.require(:friend).permit(:first_name, :last_name, :age, :gender, :city, :price, :description)
  end
end
