class MyLikesController < ApplicationController

def index
  @user = current_user
  @photos = Photo.all
    @comment = Comment.new
    @like = Like.new

end

end
