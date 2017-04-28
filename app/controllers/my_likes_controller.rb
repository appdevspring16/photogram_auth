class MyLikesController < ApplicationController
  def index
    @my_likes = current_user
  end
end
