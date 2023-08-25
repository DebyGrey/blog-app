class Comment < ApplicationRecord
  # Attributes
  attribute :text, :text

  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  # Validations
  validates :text, presence: true

  # Methods
  after_save :update_post_comments_counter

  private

  def update_post_comments_counter
    post.increment!(:comments_counter)
  end
end
