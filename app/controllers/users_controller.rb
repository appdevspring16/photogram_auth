class UsersController < ApplicationController

def show
@a=[]
@user = User.find(params[:id])

end


def index
@users = User.all
end

end
