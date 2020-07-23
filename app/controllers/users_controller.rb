class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by({:id => params[:user_id]})
    @photos = @user.photos

  end

end
