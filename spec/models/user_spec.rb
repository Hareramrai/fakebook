require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
 
  describe 'associations' do
    it { should have_many(:posts) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_confirmation_of(:password) }
  end

  describe "#name" do 
    subject  { user.name }
    it { should eq("#{user.first_name} #{user.last_name}") }
  end

  describe '.from_omniauth' do 
    let(:request) { Faker::Omniauth.google.to_dot }

    it 'creates a new user with logged in status' do 
      user = User.from_omniauth(request)

      expect(user).to be_persisted 
      expect(user).to be_a(User)
      expect(user.logged_in).to be_truthy
    end
  end
end
