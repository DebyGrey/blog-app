require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#after_save callback' do
    it 'updates the post comments_counter attribute' do
      # Arrange
      user = User.create(name: 'John')
      post = Post.create(title: 'Hello', author: user)

      # Act
      post.comments.create(author: user, text: 'This is a comment')

      # Assert
      expect(post.reload.comments_counter).to eq(1)
    end
  end
end
