class MyLikesController < ApplicationController
  def show
    @photos = Photo.all
  end
end
