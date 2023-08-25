class User < ApplicationRecord
  # Attributes
  attribute :name, :string
  attribute :photo, :string
  attribute :bio, :text
  attribute :posts_counter, :integer

  # Associations
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Methods
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
