require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  before(:each) do
    @user = User.create(name: 'test', password: 'test')
  end
  describe 'Users API' do
    path '/api/v1/users' do
      post 'create a user' do
        tags 'Users'
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            password: { type: :string }
          },
          required: %w[name password]
        }

        response '200', 'user created' do
          let(:user) { { user: { name: 'test', password: 'test' } } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:user) { { name: 'ilham' } }
          run_test!
        end
      end
    end

    path '/api/v1/login' do
      post 'User log in' do
        tags 'Users'
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            password: { type: :string }
          },
          required: %w[name password]
        }

        response '200', 'user logged in' do
          let(:user) { { user: { name: 'test', password: 'test' } } }
          run_test!
        end

        response '422', 'user not found' do
          let(:user) { { user: { name: 'test', password: 'haji' } } }
          run_test!
        end
      end
    end
  end
end
