require 'swagger_helper'

RSpec.describe 'api/movie', type: :request do

  path '/movies' do

    post 'Create a new movie' do
      tags 'movies'
      consumes 'application/json'
      parameter name: :movie, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          duration: { type: :float },
          time: { type: :datetime },
          picture: { type: :string },
          user_id: { type: :bigint },
          category_id: { type: :bigint },
          genre_id: { type: :bigint }


        },
        required: [ 'title', 'user_id', 'category_id','genre_id' ]
      }

      response '200', 'movie created' do
        let(:movie) { { title: 'the lie', user_id: 1 , category_id: 1 , genre_id: 1} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:movie) { { title: 'the lie' } }
        run_test!
      end
    end


# #   path '/movies/{id}' do

# #     get 'Retrieves a movie' do
# #       tags 'Movies', 'Movie details'
# #       produces 'application/json', 'application/xml'
# #       parameter name: :id, in: :path, type: :string
# #       request_example value: { title: 'the lie' }, name: 'basic', summary: 'Request example description'

# #       response '200', 'movie found' do
# #         schema type: :object,
# #           properties: {
# #             id: { type: :integer },
# #             title: { type: :string },
# #             description: { type: :string },
# #             duration: { type: :float },
# #             time: { type: :datetime },
# #             picture: { type: :string },
# #             user_id: { type: :bigint },
# #             category_id: { type: :bigint },
# #             genre_id: { type: :bigint }          },
# #             required: [ 'id', 'user_id', 'category_id','genre_id' ]

# #         let(:id) { Movie.create(title: 'the lie', user_id: 1 , category_id: 1 , genre_id: 1).id }
# #         run_test!
# #       end

# #       response '404', 'Movie not found' do
# #         let(:id) { 'invalid' }
# #         run_test!
# #       end

# #       response '406', 'unsupported accept header' do
# #         let(:'Accept') { 'application/text' }
# #         run_test!
# #       end
# #     end
end
