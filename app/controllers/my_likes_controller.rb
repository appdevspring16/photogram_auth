class MyLikesController < ApplicationController
  def index
    @my_likes = User.all
  end
end
