class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    @like = Like.new

    @comment = Comment.new
    @comment.body = params[:body]
    if @comment.save
      redirect_to "/photos", :notice => "Comment created successfully"
    end

  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    @comment = Comment.new
  end

  def create
    @photo = Photo.new
    @photo.caption = params[:caption]
    @photo.image = params[:image]
    @photo.user_id = params[:user_id]

    if @photo.save
      redirect_to "/photos", :notice => "Photo created successfully."
    else
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.caption = params[:caption]
    @photo.image = params[:image]
    @photo.user_id = params[:user_id]

    if @photo.save
      redirect_to "/photos", :notice => "Photo updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    @photo.destroy

    redirect_to "/photos", :notice => "Photo deleted."
  end
end
