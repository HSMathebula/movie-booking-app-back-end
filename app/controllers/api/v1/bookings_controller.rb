class Api::V1::BookingsController < ApplicationController   
  def index
    @bookings = Booking.all.order(created_at: :desc)
    render json: @reservations, status: :ok
  end
end
