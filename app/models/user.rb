class User < ApplicationRecord
  has_many :movies
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true
end
