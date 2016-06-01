class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @photos = Photo.where({ :user_id => current_user.id })
            @comment = Comment.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.caption = params[:caption]
    @user.image = params[:image]
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

    @user.caption = puser[:caption]
    @user.image = params[:image]
    @user.user_id = params[:user_id]

    if @user.save
      redirect_to "/photos", :notice => "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    redirect_to "/users", :notice => "User deleted."
  end
end
