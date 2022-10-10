class Booking < ApplicationRecord
  belongs_to :movie, foreign_key: 'movie_id'
  belongs_to :user, foreign_key: 'user_id'

  validates :city, presence: true, length: { maximum: 250 }
  validates :user_id, :movie_id, presence: true
  validates :date, presence: true
end
