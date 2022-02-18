class Comment < ApplicationRecord
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :post
  belongs_to :author, class_name: 'User'
  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
