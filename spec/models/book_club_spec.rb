require 'rails_helper'

RSpec.describe BookClub, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  describe 'associations' do
    it { should belong_to(:admin).class_name('User') }
    it { should have_many(:book_club_memberships) }
    it { should have_many(:members).through(:book_club_memberships) }
    it { should have_many(:book_readings) }
    it { should have_many(:books).through(:book_readings) }
  end
end