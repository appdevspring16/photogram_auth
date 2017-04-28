class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def show_likes
    @user = User.find(current_user.id)
    @photos = @user.liked_photos
  end
end
