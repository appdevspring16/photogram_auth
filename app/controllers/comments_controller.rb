class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.photo_id = params[:photo_id]
    @comment.body = params[:body]
    @comment.user_id = params[:user_id]

    if @comment.save

      if Rails.application.routes.recognize_path(request.referrer)[:controller] == "photos" && Rails.application.routes.recognize_path(request.referrer)[:action] == "index"
        redirect_to "/photos"
      else
        redirect_to "/comments", :notice => "Comment created successfully."
      end
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.photo_id = params[:photo_id]
    @comment.body = params[:body]
    @comment.user_id = params[:user_id]

    if @comment.save
      redirect_to "/comments", :notice => "Comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to "/comments", :notice => "Comment deleted."
  end
end
