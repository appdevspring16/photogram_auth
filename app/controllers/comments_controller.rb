class CommentsController < ApplicationController

  before_action :current_user_must_be_owner, :only => [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, :only => [:index]

  def current_user_must_be_owner
    @comments = Comment.find(params[:id])

    if current_user != @comments.user
      redirect_to "/comments", :alert => "Not authorized."
    end
  end

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
      redirect_to "/comments", :notice => "Comment created successfully."
    else
      render 'new'
    end
  end

  def edit
    current_user_must_be_owner
    @comment = Comment.find(params[:id])
  end

  def update
    current_user_must_be_owner
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
    current_user_must_be_owner
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to "/comments", :notice => "Comment deleted."
  end
end
