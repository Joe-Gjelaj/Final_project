class UsersController < ApplicationController
  def index
    @users = User.all
    current_user
  end

  def show
    @posts = User.find(params[:id]).posts
    current_user
  end
  
end

