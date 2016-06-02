class UsersController < ApplicationController

  def index

    @users = User.all

  end

   def show
    @user = User.find(params[:id])
     @comment = Comment.new
    @like = Like.new
    
    
     
     
  end


end