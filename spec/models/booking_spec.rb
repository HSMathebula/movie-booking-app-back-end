require 'rails_helper'

RSpec.describe Booking, type: :model do
    before(:each) do
    @user = User.create(name: 'test', password: 'test')
    @category = Category.create(name: 'Horror')
    @genre = Genre.create(name: 'Romantic')
    @movie = Movie.create(title: 'The head', user_id: @user.id, category_id: @category.id, genre_id: @genre.id)
  end

  subject do
    described_class.new(city: 'rabat', date: '2002/10/15', user_id: @user.id, movie_id: @movie.id)
  end

  it 'should have a valid city' do
  subject.city = 'rabat'
  expect(subject).to be_valid
  end
end
