require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#after_save callback' do
    it 'updates the post likes_counter attribute' do
      # Arrange
      user = User.create(name: 'John')
      post = Post.create(title: 'Hi', author: user)

      # Act
      post.likes.create(author: user)

      # Assert
      expect(post.reload.likes_counter).to eq(1)
    end
  end
end
