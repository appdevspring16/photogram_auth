class LikesController < ApplicationController
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
    @like.user_id =  params[:user_id]
    @like.photo_id = params[:photo_id]

    user = User.find(params[:user_id])
    # SG: if the like association already exists then remove it
    if ( user.liked_photos.exists?(Photo.find(params[:photo_id])))
      old_like = user.likes.find_by( {:photo_id => params[:photo_id]})
      old_like.destroy
      redirect_to "/my_likes", :notice => "Like destroyed successfully."
    else
      if @like.save
        redirect_to "/my_likes", :notice => "Like created successfully."
      else
        render 'new'
      end
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
