class BookClub < ApplicationRecord
  belongs_to :admin, class_name: 'User'
  has_many :book_club_memberships
  has_many :members, through: :book_club_memberships, source: :user
  has_many :book_readings
  has_many :books, through: :book_readings
  
  validates :name, presence: true
  validates :description, presence: true
end