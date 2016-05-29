class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user_photos = current_user.photos
  end
end
