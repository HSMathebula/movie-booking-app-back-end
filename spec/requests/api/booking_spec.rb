require 'swagger_helper'

RSpec.describe 'api/bookings', type: :request do
  before(:each) do
    @user = User.create(name: 'test', password: 'test')
    @category = Category.create(name: 'Horror')
    @genre = Genre.create(name: 'Romantic')
    @movie = Movie.create(title: 'War bus', user_id: @user.id, category_id: @category.id, genre_id: @genre.id)
    @booking = Booking.create(city: 'test', user_id: @user.id, date: '2022-02-2', movie_id: @movie.id)
  end

  describe 'Bookings API' do
    path '/api/v1/users/:user_id/bookings' do
      get 'Retrieve bookings' do
        tags 'Bookings'
        consumes 'application/json'
        parameter name: :user_id, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            city: { type: :string },
            date: { type: :date },
            picture: { type: :string },
            user_id: { type: :bigint },
            movie_id: { type: :bigint }
          },
          required: %w[city date user_id movie_id]
        }

        response '200', 'bookings retrieved' do
          let(:user_id) { @user.id }
          run_test!
        end
      end
    end

    path '/api/v1/users/:user_id/bookings' do
      post 'Create booking' do
        tags 'Bookings'
        consumes 'application/json'
        parameter name: :user_id, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            city: { type: :string },
            date: { type: :date },
            picture: { type: :string },
            user_id: { type: :bigint },
            movie_id: { type: :bigint }
          },
          required: %w[city date user_id movie_id]
        }

        response '201', 'booking created' do
          let(:user_id) do
            { user_id: @user.id, booking: { city: 'test', user_id: @user.id, date: '2022-02-2', movie_id: @movie.id } }
          end
          run_test!
        end
      end
    end
  end
end
