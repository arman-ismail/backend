class User < ApplicationRecord
  has_secure_password
  
  has_many :book_club_memberships
  has_many :book_clubs, through: :book_club_memberships
  has_many :book_summaries
  
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
end