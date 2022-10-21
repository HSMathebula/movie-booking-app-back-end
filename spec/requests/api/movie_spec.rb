require 'swagger_helper'

RSpec.describe 'api/movies', type: :request do

  before(:each) do
    @user = User.create(name: 'test', password: 'test')
    @category = Category.create(name: 'Horror')
    @genre = Genre.create(name: 'Romantic')
    @movie = Movie.create(title: 'War bus', user_id: @user.id, category_id: @category.id, genre_id: @genre.id)
  end

  describe 'Movies API' do
    path '/api/v1/movies' do
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

        response '200', 'movie created successfully' do
          let(:movie) {{ title: 'test', user_id: @user.id, category_id: @category.id, genre_id: @genre.id  }}
          run_test!
        end

      end
    end

    path '/api/v1/movies/{id}' do
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
        end

        response '200', 'movie found ' do
          let(:id) { @user.id }
          run_test!
        end
 
      end
    end

    path '/api/v1/movies/latest_movies/page/{page}' do
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
        end

        response '200', 'Latest movies retrieved ' do
          let(:page) { 1 }
          run_test!
        end
      end
    end

    path '/api/v1/movies/{id}' do
      delete 'Delete a movie' do
        tags 'Movies'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string

        response '200', 'Movies deleted' do
          let(:id) { @movie.id }
          run_test!
        end
      end
    end
  end
end