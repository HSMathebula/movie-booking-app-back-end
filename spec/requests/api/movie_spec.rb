require 'swagger_helper'
RSpec.describe 'api/movies', type: :request do
  before(:each) do
    @user = User.create(name: 'test', password: 'test')
    @category = Category.create(name: 'Horror')
    @genre = Genre.create(name: 'Romantic')
    @movie = Movie.create(title: 'War bus', user_id: @user.id, category_id: @category.id, genre_id: @genre.id)
  end
  describe 'Movies API' do
    path '/movies' do
      post 'Creates a movie' do
        tags 'Movies'
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
          required: %w[title user_id category_id genre_id]
        }

        response '200', 'movie created' do
          let(:movie) { { title: 'the lie', user_id: @user.id, category_id: @category.id, genre_id: @genre.id } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:movie) { { title: 'the lie' } }
          run_test!
        end
      end
    end

    path '/movies/{id}' do
      get 'Retrieves a movie' do
        tags 'Movies'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'movie found' do
          schema type: :object,
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
                required: %w[title user_id category_id genre_id]

          let(:id) { Movie.create(title: 'the lie', user_id: 1, category_id: 1, genre_id: 1).id }
          run_test!
        end

        response '404', 'movie not found' do
          let(:id) { 'invalid' }
          run_test!
        end

        response '406', 'unsupported accept header' do
          let(:Accept) { 'application/movie' }
          run_test!
        end
      end
    end

    path '/movies/latest_movies/page/{page}' do
      get 'Retrieves latest movies' do
        tags 'Movies'
        produces 'application/json', 'application/xml'
        parameter name: :page, in: :path, type: :string

        response '200', 'movie found' do
          schema type: :object,
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
                required: ['page']

          let(:id) { Movie.create(title: 'the lie', description: 'sample description').id }
          run_test!
        end

        response '404', 'movie not found' do
          let(:id) { 'invalid' }
          run_test!
        end

        response '406', 'unsupported accept header' do
          let(:Accept) { 'application/movie' }
          run_test!
        end
      end
    end

    path '/movies/{id}' do
      delete 'Delete a movie' do
        tags 'Movies'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string

        response '200', 'movie deleted' do
          let(:movie) { { title: 'the lie', user_id: 1, category_id: 1, genre_id: 1 } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:movie) { { title: 'the lie' } }
          run_test!
        end
      end
    end
  end
end