class LikesController < ApplicationController

  before_action :current_user_must_be_owner, :only => [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, :only => [:index]

  def current_user_must_be_owner
    @likes = Like.find(params[:id])

    if current_user != @likes.user
      redirect_to "/likes", :alert => "Not authorized."
    end
  end

  def index
    @likes = Like.all
  end

  def show
    @like = Like.find(params[:id])
  end

  def new
    @like = Like.new
  end

  def create
    @like = Like.new
    @like.user_id = params[:user_id]
    @like.photo_id = params[:photo_id]

    if @like.save
      redirect_to "/likes", :notice => "Like created successfully."
    else
      render 'new'
    end
  end

  def edit
    @like = Like.find(params[:id])
  end

  def update
    @like = Like.find(params[:id])

    @like.user_id = params[:user_id]
    @like.photo_id = params[:photo_id]

    if @like.save
      redirect_to "/likes", :notice => "Like updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @like = Like.find(params[:id])

    @like.destroy

    redirect_to "/likes", :notice => "Like deleted."
  end
end
