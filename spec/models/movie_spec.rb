require 'rails_helper'

RSpec.describe Movie, type: :model do
  before(:each) do
    @user = User.create(name: 'test', password: 'test')
    @category = Category.create(name: 'Horror')
    @genre = Genre.create(name: 'Romantic')
  end

  subject do
    described_class.new(title: 'War bus', user_id: @user.id, category_id: @category.id, genre_id: @genre.id)
  end

  it 'is not valid without title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without category_id' do
    subject.genre_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without genre_id' do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end
end
