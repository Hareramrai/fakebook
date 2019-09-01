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
end
