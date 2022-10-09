class User < ApplicationRecord
  has_secure_password
  has_many :movies
  has_many :bookings

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
end
