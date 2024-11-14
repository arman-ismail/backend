class Book < ApplicationRecord
  has_many :book_readings
  has_many :book_clubs, through: :book_readings
  has_many :book_summaries
  
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
end