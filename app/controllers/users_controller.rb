class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def my_likes
    @my_likes = current_user.liked_photos

    render("likes.html.erb")
  end
end
