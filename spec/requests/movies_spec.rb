require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  before(:each) do
    @user = User.create(name: 'test', password: 'test')
    @category = Category.create(name: 'Horror')
    @genre = Genre.create(name: 'Romantic')
    @movie = Movie.create(title: 'War bus', user_id: @user.id, category_id: @category.id, genre_id: @genre.id)
  end

  describe 'GET #index' do
    it 'returns a 200 status code' do
      get api_v1_movies_path
      expect(response).to have_http_status(200)
    end

    it 'the response body includes correct placeholder' do
      get api_v1_movies_path
      expect(response.body).to include('War bus')
    end
  end

  describe 'GET #latest_movies' do
    it 'returns a 200 status code' do
      get latest_movie_api_v1_movies_path(page: 1)
      expect(response).to have_http_status(200)
    end

    it 'the response body includes correct placeholder' do
      get latest_movie_api_v1_movies_path(page: 1)
      expect(response.body).to include('War bus')
    end
  end
end
