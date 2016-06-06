class PhotosController < ApplicationController

  before_action :current_user_must_be_owner, :only => [:edit, :update, :destroy]
  		  # with :only action we are white listing (can blacklist with :except) and placing a filter

  # but we can allow visitor to visit :index page without signing in or signing up + and to skip the filter above
  skip_before_action :authenticate_user!, :only => [:index]

  def current_user_must_be_owner
    @photo = Photo.find(params[:id])

    if current_user != @photo.user
      redirect_to "/photos/", :alert => "not authorized"
    end
  end

  def my_likes
    @photos = current_user.liked_photos
  end

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
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
    # current_user_must_be_owner
    @photo = Photo.find(params[:id])
  end

  def update
    # current_user_must_be_owner
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
    # current_user_must_be_owner
    @photo = Photo.find(params[:id])

    @photo.destroy

    redirect_to "/photos", :notice => "Photo deleted."
  end
end
