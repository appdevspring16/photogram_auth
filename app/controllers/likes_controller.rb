class LikesController < ApplicationController
  def index
    @likes = Like.all
  end

  def show
    @like = Like.find(params[:id])
  end

  def my_likes
    @liked_photos = User.find_by( :id => current_user.id  ).likes.all
    # @liked_photos.caption = Photo.caption
    # @liked_photo.caption = Photo.caption
    # @photo.image = params[:image]
    # @photo.user_id = params[:user_id]
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
