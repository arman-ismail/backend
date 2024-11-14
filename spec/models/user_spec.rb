require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:username) }
    it { should have_secure_password }
  end

  describe 'associations' do
    it { should have_many(:book_club_memberships) }
    it { should have_many(:book_clubs).through(:book_club_memberships) }
    it { should have_many(:book_summaries) }
  end
end