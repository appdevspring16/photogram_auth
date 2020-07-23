class PhotosController < ApplicationController

  before_action :authenticate_user, only: [:edit, :update, :destroy]

  def authenticate_user
    b_user_id = Photo.find(params[:id]).user_id

    if (b_user_id != current_user.id)
      redirect_to "/", :alert => "You are not authorized to perform this action."
    end
  end


  def index
    @photos = Photo.all
    @photo = Photo.new
    @likes = Like.all
    @like = Like.new
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    @photo.user_id = current_user
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
