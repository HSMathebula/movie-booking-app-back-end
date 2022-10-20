require 'swagger_helper'

RSpec.describe 'api/genre', type: :request do
  path '/genres' do
    get 'index' do
      tags 'Genres'
      consumes 'application/json'
      parameter name: :genre, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '200', 'genre created' do
        let(:genre) { { title: 'Romantic' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:genre) { { title: 'Romantic' } }
        run_test!
      end
    end
  end
end
