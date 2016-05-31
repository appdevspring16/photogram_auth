class LikesController < ApplicationController
  def index
    @likes = Like.all
  end

  def my_index
    @likes = current_user.likes
    @comments = Comment.all
    @comment = Comment.new
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
      redirect_to URI(request.referrer).path, :notice => "Like created successfully."
    else
      redirect_to URI(request.referrer).path
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
