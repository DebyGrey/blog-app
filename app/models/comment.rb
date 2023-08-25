class Comment < ApplicationRecord
  # Attributes
  attribute :text, :text

  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  # Methods
  after_create :update_post_comments_counter

  def update_post_comments_counter
    post.increment!(:comments_counter)
  end
end
