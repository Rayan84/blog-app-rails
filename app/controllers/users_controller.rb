class UsersController < ApplicationController
  def index
    @user = User.all
    @posts = Post.all
  end

  def show
    @likes = Like.all.includes(:post_id)
    @comments = Comment.all.includes(:post_id).order(created_at: :desc)
    @user = User.find_by(id: params[:id])
  end
end
