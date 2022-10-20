require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'ilham', password: 'password')
  end

  before { subject.save }

  it 'should have valid name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'should have valid password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
