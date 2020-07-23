class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
  end

  def my_likes
    @liked_photos= User.find_by( :id => current_user.id  ).likes.all
  end
end
