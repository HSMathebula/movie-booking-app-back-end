require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /index" do
    it 'returns a 200 status code ' do
      get api_v1_categories_path
      expect(response).to have_http_status(200)
    end  
  end
end
