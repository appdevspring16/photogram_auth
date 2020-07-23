class MylikesController < ApplicationController
  def index
    @Mylikes = Like.all
  end
end
