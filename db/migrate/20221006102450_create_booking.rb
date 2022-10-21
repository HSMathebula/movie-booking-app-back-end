class CreateBooking < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :city
      t.date :date

      t.timestamps
    end
  end
end
