require 'swagger_helper'

RSpec.describe 'api/user', type: :request do
     path '/users' do

    post 'create a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          password: { type: :string },
        },
        required: [ 'name', 'password' ]
      }

      response '200', 'user created' do
        let(:user) { { name: 'ilham', password: 'ilham123'} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'ilham' } }
        run_test!
      end
    end
  end

path '/users/{id}' do

   get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json', 'application/xml'
       parameter name: :id, in: :path, type: :string
       response '200', 'movie found' do
         schema type: :object,
           properties: {
             name: { type: :string },
             password: { type: :string },
           },
           required: [ 'name', 'password' ]

         let(:id) { User.create(name: 'ilham', password: 'ilham123').id }
         run_test!
       end

       response '404', 'movie not found' do
         let(:id) { 'invalid' }
         run_test!
       end

       response '406', 'unsupported accept header' do
         let(:'Accept') { 'application/movie' }
         run_test!
       end
     end
   end
end
