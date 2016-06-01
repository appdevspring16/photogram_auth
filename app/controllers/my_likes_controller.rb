class MyLikesController < ApplicationController
  def index
    @my_likes = Like.all
  end

  def show
    @my_like = Like.find(params[:id])
  end

  def new
    @my_like = Like.new
  end

  def create
    @my_like = Like.new
    @my_like.user_id = params[:user_id]
    @my_like.photo_id = params[:photo_id]

    if @my_like.save
      redirect_to "/my_likes", :notice => "Like created successfully."
    else
      render 'new'
    end
  end

  def edit
    @my_like = Like.find(params[:id])
  end

  def update
    @my_like = Like.find(params[:id])

    @my_like.user_id = params[:user_id]
    @my_like.photo_id = params[:photo_id]

    if @my_like.save
      redirect_to "/my_likes", :notice => "Like updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @my_like = Like.find(params[:id])

    @my_like.destroy

    redirect_to "/my_likes", :notice => "Like deleted."
  end
end
