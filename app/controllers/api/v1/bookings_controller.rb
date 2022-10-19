class Api::V1::BookingsController < ApplicationController
  before_action :set_booking_params, only: %i[show update destroy]

  def index
    @bookings = Booking.joins(:movie).select('bookings.*, movies.*').order('bookings.created_at desc')
    render json: @bookings, status: :ok
  end

  def show
    render json: @booking, status: :ok
  end

  def create
    @created_booking = Booking.new(booking_params)

    if @created_booking.save
      render json: @created_booking, status: :created
    else
      render json: { errors: @created_booking.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    if @booking.update(booking_params)
      render json: @booking, status: :ok
    else
      render json: { errors: @booking.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    if @booking.destroy
      render json: { message: 'booking deleted succesfully.' }
    else
      render json: { message: 'Unsuccessful' }, status: :unprocessable_entity
    end
  end

  private

  def set_booking_params
    @booking = Booking.includes(:movie).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'booking not found' }, status: :not_found
  end

  def booking_params
    params.require(:booking).permit(:city, :date, :movie_id, :user_id)
  end
end
