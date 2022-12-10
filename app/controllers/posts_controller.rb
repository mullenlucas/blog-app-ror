class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(comments: [:author])
  end

  def show
    @user = User.find_by(params[:author_id])
    @post = Post.find_by(params[:id])
  end
end
