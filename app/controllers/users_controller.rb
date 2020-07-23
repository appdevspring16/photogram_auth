class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @likes = Like.all
    @user = User.find(params[:id])
    @comments = Comment.all
    @comment = Comment.new
  end
end
