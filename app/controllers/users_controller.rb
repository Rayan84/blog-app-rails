class UsersController < ApplicationController
  def index; end

  def show
    Post.all.each do |post|
      post.update(CommentsCounter: Comment.where(posts_id: post.id).count)
      post.update(likes_counter: Like.where(posts_id: post.id).count)
    end

    @recent_posts = Post.limit(6).where(author_id: params[:id]).order(created_at: :desc)
    @comments = Comment.all.order(created_at: :desc)
    @current_user = User.find_by(id: params[:id])
    @current_user.update(PostsCounter: Post.where(author_id: @current_user.id).count)
  end
end
