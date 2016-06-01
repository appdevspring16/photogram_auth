class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
    @comments = Comment.all
    @photos = Photo.all
  end

  def my_likes
    @Users = current_user
    @Likes = Like.all
  end

  def new
    @users = User.new
  end

end

before_action :authenticate_user!
