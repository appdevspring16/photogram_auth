class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos
  end

  def my_likes
    @user = User.find(current_user.id)
    @my_likes = @user.likes
  end

end
