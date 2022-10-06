class Category < ApplicationRecord
  has_many :movies

  validates :name, presence: true, length: {maximum: 250}
end
