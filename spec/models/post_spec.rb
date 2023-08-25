require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'John') }
  let(:subject_post) { Post.new(title: 'Welcome', author: user) }

  describe 'validation tests' do
    it 'title should be present' do
      subject_post.title = nil
      expect(subject_post).to_not be_valid
    end

    it 'title should be less than 251 chars' do
      subject_post.title = 'Lorem ipsum dolor sit amet,
      consectetuer adipiscing elit. Aenean commodo ligula
      eget dolor. Aenean massa. Cum sociis natoque penatibus
      et magnis dis parturient montes, nascetur ridiculus mus.
      Donec quam felis, ultricies neln ea'
      expect(subject_post).to_not be_valid
    end

    it 'comments_counter should be integer' do
      subject_post.comments_counter = 'hi'
      expect(subject_post).to_not be_valid
    end

    it 'comments_counter should be greater than or equal to zero' do
      subject_post.comments_counter = -2
      expect(subject_post).to_not be_valid
      subject_post.comments_counter = 0
      expect(subject_post).to be_valid
    end

    it 'likes_counter should be greater than or equal to zero' do
      subject_post.likes_counter = -2
      expect(subject_post).to_not be_valid
      subject_post.likes_counter = 0
      expect(subject_post).to be_valid
    end
  end

  describe '#update_user_posts_counter' do
    it 'updates the user posts_counter attribute' do
      # Act
      subject_post.send(:update_user_posts_counter)

      # Assert
      expect(user.reload.posts_counter).to eq(1)
    end
  end

  describe '#five_most_recent_comments' do
    it 'returns the 5 most recent comments' do
      # Arrange
      comment1 = Comment.create(author: user, post: subject_post, text: 'comment 1', created_at: 5.days.ago)
      comment2 = Comment.create(author: user, post: subject_post, text: 'comment 2', created_at: 4.days.ago)
      comment3 = Comment.create(author: user, post: subject_post, text: 'comment 3', created_at: 3.days.ago)
      comment4 = Comment.create(author: user, post: subject_post, text: 'comment 4', created_at: 2.days.ago)
      comment5 = Comment.create(author: user, post: subject_post, text: 'comment 5', created_at: 1.days.ago)

      # Act
      recent_comments = subject_post.send(:recent_comments)

      # Assert
      expect(recent_comments).to eq([comment5, comment4, comment3, comment2, comment1])
    end
  end
end
