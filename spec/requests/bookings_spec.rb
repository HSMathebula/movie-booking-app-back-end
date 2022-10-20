require 'rails_helper'

RSpec.describe 'Bookings', type: :request do
  describe 'GET /index' do
    it 'should return a 200 status code ' do
      get api_v1_bookings_path
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET /show' do
    it 'should return a 200 status code ' do
      get api_v1_bookings_path
      expect(response).to have_http_status(200)
    end
  end
end
