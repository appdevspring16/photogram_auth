class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user =  User.find(params[:id])
    @photos = @user.photos.all
  end
end
