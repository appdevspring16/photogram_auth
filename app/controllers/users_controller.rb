class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  @photos=current_user.photos
  end

  def my_likes
  @photos=current_user.liked_photos
  end

end
