class Like < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post'

  # Methods
  # after_save :update_post_likes_counter
  # after_destroy :update_post_likes_counter

  # Callback
  after_save :increment_post_likes_counter
  after_destroy :decrement_post_likes_counter

  private

  # def update_post_likes_counter
  #   post.increment!(:likes_counter)
  # end

  def increment_post_likes_counter
    post.increment!(:likes_counter)
  end

  def decrement_post_likes_counter
    post.decrement!(:likes_counter)
  end
end
