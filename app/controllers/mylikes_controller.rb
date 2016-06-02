class MylikesController < ApplicationController

  def mylikes
    @likes = Likes.all
  end

  def show
    @user = User.find(params[:id])
  end

end
