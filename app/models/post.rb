class Post < ApplicationRecord
  # Attributes
  attribute :title, :string
  attribute :text, :text
  attribute :comments_counter, :integer
  attribute :likes_counter, :integer

  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Methods
  after_save :update_user_posts_counter

  private

  def update_user_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
