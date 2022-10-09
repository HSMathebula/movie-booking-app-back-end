class Api::V1::BookingsController < ApplicationController   
  def index
    @bookings = Booking.all.order(created_at: :desc)
    render json: @bookings, status: :ok
  end

  def show
    render json: @booking, status: :ok
  end

  def create
    @movie = Movies.find(params[:movie_id])

    @created_booking = Booking.new(booking_params)
    @created_booking.movie_id = @movie.id

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

  def booking_params
    params.require(:booki).permit(:city, :date, :movie_id, :user_id)
  end
end
ng