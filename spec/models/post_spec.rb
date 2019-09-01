require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
 
  describe 'associations' do
    it { should have_many(:photos) }
    it { should belong_to(:user) }
  end

   it { should accept_nested_attributes_for(:photos) }

  describe 'delegations' do 
    it { should delegate_method(:name).to(:user).with_prefix }
    it { should delegate_method(:profile_image).to(:user).with_prefix }
  end

  describe ".latest" do 
    it 'orders on created_at as desc' do 
      expect(Post.latest.to_sql).to eq(Post.order(created_at: :desc).to_sql)
    end
  end
end
