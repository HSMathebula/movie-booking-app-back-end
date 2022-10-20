require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    Category.create(name: 'comedie')
  end

  before { subject.save }

  it 'should have a valid name' do
    subject.name = 'Romantic'
    expect(subject).to be_valid
  end
end
