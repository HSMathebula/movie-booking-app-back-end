class AddMovieToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :movie, null: false, foreign_key: true, index: true
  end
end
