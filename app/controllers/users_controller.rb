class UsersController < ApplicationController

  
  def index
    @users = User.all
    render 'index'
  end

  def show
    @users = User.find(params[:id])
  end



end
