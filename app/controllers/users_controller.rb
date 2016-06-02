class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @likes = Like.all
    @comments = Comment.all
    @comment = Comment.new
  end
end
