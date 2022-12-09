class PostsController < ApplicationController
  def index
    @user = User.find(params[:name])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
