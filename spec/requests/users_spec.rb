require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  let!(:user) { User.create(name: 'John Doe') }

  describe 'GET #index' do
    before do
      get users_path
    end

    context 'Applies all test to index template' do
      it 'should check if the response status is correct' do
        expect(response).to have_http_status(200)
      end
      it 'should check if a correct template was rendered' do
        expect(response).to render_template(:index)
      end
      it 'should check if the response body includes the correct placeholder text' do
        expect(response.body).to include('Here is a list of users')
      end
    end
  end

  describe 'GET #show' do
    before do
      get user_path(user)
    end

    context 'Applies all test to show template' do
      it 'should check if the response status is correct' do
        expect(response).to have_http_status(200)
      end
      it 'should check if a correct template was rendered' do
        expect(response).to render_template(:show)
      end
      it 'should check if the response body includes the correct placeholder text' do
        expect(response.body).to include('Displays bio data of a given user')
      end
    end
  end
end
