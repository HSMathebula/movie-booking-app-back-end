require 'swagger_helper'

RSpec.describe 'api/category', type: :request do

  before(:each) do
    @category = Category.create(name: 'test')
  end

  describe 'Categories' do
    path '/api/v1/categories' do
      get 'index' do
        tags 'Categories'
        consumes 'application/json'
        parameter schema: {
          type: :object,
          properties: {
            id: {type: :bigint},
            name: { type: :string },
            created_at: {type: :date},
            updated_at: {type: :date},
          },
        }
  
        response '200', 'categories retrieved' do
          run_test!
        end 

      end
    end
  end
  
end
