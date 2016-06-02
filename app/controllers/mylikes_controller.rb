class MylikesController < ApplicationController


  def index
    @User = User.find(params[:id])
  end


end
