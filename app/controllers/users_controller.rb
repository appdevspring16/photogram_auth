class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def details
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.photo_id = params[:photo_id]
    @user.body = params[:body]
    @user.user_id = params[:user_id]

    if @user.save
      redirect_to "/users", :notice => "User created successfully."
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.photo_id = params[:photo_id]
    @user.body = params[:body]
    @user.user_id = params[:user_id]

    if @user.save
      redirect_to "/users", :notice => "user updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    redirect_to "/users", :notice => "user deleted."
  end
end
