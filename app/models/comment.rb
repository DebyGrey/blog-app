class Comment < ApplicationRecord
  # Attributes
  attribute :text, :text

  # Associations
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # Validations
  validates :text, presence: true
end
