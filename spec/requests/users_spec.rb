require 'rails_helper'

RSpec.describe "Users", type: :request do
  before(:each) do
    @user = User.create(name: 'ilham', password: 'ilham123')
  end

  describe 'POST create' do
    it "responds to html by default" do
      post api_v1_users_path, :params => { :user => { :name => "user", :password => "user123" } }
      expect(response.status).to eq (200)
    end
  end

  describe 'POST login' do
    it "responds to html by default" do
      post api_v1_login_path, :params => { :user => { :name => "ilham", :password => "ilham123" } }
      expect(response.status).to eq (200)
    end
  end
end
