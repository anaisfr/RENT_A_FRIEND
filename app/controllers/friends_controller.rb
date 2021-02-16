class FriendsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friends_params)
    @friend.save
    redirect_to root_path
  end

  private

  def friends_params
    params.require(:friend).permit(:first_name, :last_name, :age, :gender, :city, :price)
  end
end
