require 'rails_helper'

RSpec.describe 'Bookings', type: :request do
  describe 'GET /index' do
    it 'should return a 200 status code ' do
      get api_v1_user_bookings_path(1)
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET /show' do
    it 'should return a 200 status code ' do
      get api_v1_user_booking_path(user_id: 1, id: 1)
      expect(response).to have_http_status(404)
    end
  end
end
