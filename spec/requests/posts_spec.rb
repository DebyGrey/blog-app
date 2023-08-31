require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  let!(:user) { User.create(name: 'John Doe') }
  let!(:post) { Post.create(author: user, title: 'Test Post') }

  describe 'GET /index' do
    before do
      get user_posts_path(user)
    end

    context 'Applies all test to index template' do
      it 'should check if the response status is correct' do
        expect(response).to have_http_status(200)
      end
      it 'should check if a correct template was rendered' do
        expect(response).to render_template(:index)
      end
      it 'should check if the response body includes the correct placeholder text' do
        expect(response.body).to include('Here is a list of posts for a given user')
      end
    end
  end

  describe 'GET #show' do
    before do
      get user_post_path(user, post)
    end

    context 'Applies all test to show template' do
      it 'should check if the response status is correct' do
        expect(response).to have_http_status(200)
      end
      it 'should check if a correct template was rendered' do
        expect(response).to render_template(:show)
      end
      it 'should check if the response body includes the correct placeholder text' do
        expect(response.body).to include('Displays selected post by an given user')
      end
    end
  end
end
