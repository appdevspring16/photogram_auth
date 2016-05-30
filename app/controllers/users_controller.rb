class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @all_likes = []
    @user_photos = current_user.photos
  end

  def my_likes
    @liked_photos = current_user.liked_photos
  end
end
