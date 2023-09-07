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

  # Validations
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Callback
  # after_save :update_user_posts_counter
  after_save :increase_user_posts_counter
  after_destroy :decrease_user_posts_counter

  # Methods
  private

  # def update_user_posts_counter
  #   author.increment!(:posts_counter)
  # end

  # def recent_comments
  #   comments.order(created_at: :desc).limit(5)
  # end

  def increase_user_posts_counter
    author.increment!(:posts_counter)
  end

  def decrease_user_posts_counter
    author.decrement!(:posts_counter)
  end

  def recent_comments
    comments.includes(:author).order(created_at: :asc).limit(5)
  end
end
