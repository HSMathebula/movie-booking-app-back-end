class Movie < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :genre
  has_many :bookings

  validates :title, presence: true, length: {maximum: 250}
  validates :user_id, :category_id, :genre_id, presence: true
  validates :picture, length: {maximum: 250}

end
