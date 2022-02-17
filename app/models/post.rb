class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :post_counter

  def five_recent_comments
    Comment.limit(5).order(created_at: :desc)
  end

  private

  def post_counter
    author.increment!(:posts_counter)
  end
end
