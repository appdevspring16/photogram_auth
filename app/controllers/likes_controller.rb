class LikesController < ApplicationController

  def mylikes
    @likes = Like.where(:user_id => current_user.id)
    @photos = []
    @likes.each do |like|
      @photos.push like.photo
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
      if Rails.application.routes.recognize_path(request.referrer)[:controller] == "photos" && Rails.application.routes.recognize_path(request.referrer)[:action] == "index"
        redirect_to "/photos", :notice => "Like created successfully."
      else
        redirect_to "/likes", :notice => "Like created successfully."
      end
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

    if Rails.application.routes.recognize_path(request.referrer)[:controller] == "photos" && Rails.application.routes.recognize_path(request.referrer)[:action] == "index"
      redirect_to "/photos", :notice => "Like deleted."
    else
      redirect_to "/likes", :notice => "Like deleted."
    end

  end
end
