class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @photo = Photo.new
    @photos = Photo.all
    @comment = Comment.new
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.email = params[:email]
    @user.username = params[:username]

    if @user.save
      redirect_to "/photos", :notice => "Photo updated successfully."
    else
      render 'edit'
    end
  end

end
