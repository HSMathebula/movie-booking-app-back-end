require 'swagger_helper'

RSpec.describe 'api/genre', type: :request do
  before(:each) do
    @category = Genre.create(name: 'test')
  end

  describe 'Genres' do
    path '/api/v1/genres' do
      get 'index' do
        tags 'Genres'
        consumes 'application/json'
        parameter schema: {
          type: :object,
          properties: {
            id: { type: :bigint },
            name: { type: :string },
            created_at: { type: :date },
            updated_at: { type: :date }
          }
        }

        response '200', 'genres retrieved' do
          run_test!
        end
      end
    end
  end
end
