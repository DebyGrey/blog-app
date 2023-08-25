class Post < ApplicationRecord
  # Attributes
  attribute :title, :string
  attribute :tetxt, :text
  attribute :comments_counter, :integer
  attribute :likes_counter, :integer

  # Associations
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
