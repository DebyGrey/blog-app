class Comment < ApplicationRecord
  # Attributes
  attribute :text, :text

  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post'

  # Validations
  validates :text, presence: true

  # Callbacks
  after_create :increase_post_comments_counter
  after_destroy :decrement_post_comments_counter

  # Methods
  # after_save :update_post_comments_counter

  private

  # def update_post_comments_counter
  #   post.increment!(:comments_counter)
  # end

  def increase_post_comments_counter
    post.increment!(:comments_counter)
  end

  def decrement_post_comments_counter
    post.decrement!(:comments_counter)
  end
end
