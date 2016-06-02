class UsersController < ApplicationController
  def show
    render 'show'
  end

  def detail
    @user = User.find(params[:chicken])
    render 'detail'
  end
end
