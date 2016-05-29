class UsersController < ApplicationController

def index
  @users = User.all
end

def show
  @users = User.find(params[:user_id])
end
end
