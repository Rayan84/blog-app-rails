class PostsController < ApplicationController
  def index
    @params = params
    @user = User.find_by(id: params[:user_id])
    @posts = Post.limit(2).where(author_id: params[:user_id])
    @comments = Comment.all.order(created_at: :desc)

    Post.all.each do |post|
      post.update(CommentsCounter: Comment.where(posts_id: post.id).count)
      post.update(likes_counter: Like.where(posts_id: post.id).count)
    end
  end

  def show
    @recent_posts = Post.limit(3).where(author_id: params[:id]).order(created_at: :desc)
    @comments = Comment.all.order(created_at: :desc)
    @current_user = User.find_by(id: params[:id])
    @current_user.update(PostsCounter: Post.where(author_id: @current_user.id).count)
  end

  def three_recent_posts
    @recent_posts = Post.limit(3).where(author_id: params[:id]).order(created_at: :desc)
  end
end
