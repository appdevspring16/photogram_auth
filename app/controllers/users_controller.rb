class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def myLikes
    @myLike = User.find_by( :id => current_user.id  ).likes.all
  end

end
