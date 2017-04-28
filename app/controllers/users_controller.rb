class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @photo = Photo.where({:user_id => @user.id})
    @likes = Like.where({:user_id => @user.id})
    @alllikes = Like.all
    @comments = Comment.all
    @comment = Comment.new
  end


  def likes
    @user = User.find(current_user[:id])
    @photo = Photo.where({:user_id => @user.id})
    @likes = Like.where({:user_id => @user.id})
    @alllikes = Like.all
  end
end
