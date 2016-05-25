class PhotosController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @photos = Photo.all
    @likes = Like.all
    @comments = Comment.all
  end

  def show
    @photo = Photo.find(params[:id])
    @likes = Like.all
  end

  def new
    @photo = Photo.new
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
