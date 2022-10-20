require 'swagger_helper'

RSpec.describe 'api/category', type: :request do
  path '/categories' do
    get 'index' do
      tags 'Categories'
      consumes 'application/json'
      parameter name: :genre, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '200', 'category created' do
        let(:category) { { title: 'Comedie' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:category) { { title: 'Comedie' } }
        run_test!
      end
    end
  end
end
