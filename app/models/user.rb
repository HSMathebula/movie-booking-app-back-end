class User < ApplicationRecord
  has_secure_password
  has_many :movies
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
end
