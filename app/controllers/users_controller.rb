class UsersController < ApplicationController

def index
  @users = User.all
end

def show
  @user = User.find(params[:id])
  @photos = Photo.where(params[:user_id=>@user])
end

def show_likes
  @user = current_user.id

end

end
