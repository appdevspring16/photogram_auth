class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @likes = Like.where({:user_id => @user.id})
  end


  def likes
    @user = User.find(current_user[:id])
  end
end
