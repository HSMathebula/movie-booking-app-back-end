require 'rails_helper'

RSpec.describe Genre, type: :model do
  subject do
    Genre.create(name: 'comedie')
  end

  before { subject.save }

  it 'should have a valid name' do
    subject.name = 'comedie'
    expect(subject).to be_valid
  end
end
