require 'swagger_helper'

describe 'Bookings API' do
  path '/users/{user_id}/bookings' do
    post 'Creates a booking' do
      tags 'Bookings'
      consumes 'application/json'
      parameter name: :booking, in: :body, schema: {
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

      response '200', 'booking created' do
        let(:booking) { { city: 'Jozi', user_id: 1, movie_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:booking) { { city: 'Jozi' } }
        run_test!
      end
    end
  end

  path '/users/{user_id}/bookings/{id}' do
    get 'Retrieves a bookings' do
      tags 'Bookings'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'booking found' do
        schema type: :object,
               properties: {
                 title: { type: :string },
                 city: { type: :string },
                 date: { type: :date },
                 picture: { type: :string },
                 user_id: { type: :bigint },
                 movie_id: { type: :bigint }
               },
               required: %w[city date user_id movie_id]

        let(:id) { Blog.create(city: 'Jozi', date: '2022-02-02').id }
        run_test!
      end

      response '404', 'booking not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/booking' }
        run_test!
      end
    end
  end

  path '/users/{user_id}/bookings/{id}' do
    delete 'Delete a booking' do
      tags 'Bookings'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'booking deleted' do
        let(:booking) { { city: 'Jozi', user_id: 1, movie_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:booking) { { city: 'Jozi' } }
        run_test!
      end
    end
  end
end
