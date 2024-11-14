class BookSummary < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :book_club
  
  validates :content, presence: true
end