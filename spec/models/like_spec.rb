require 'rails_helper'

RSpec.describe Like, type: :model do

  describe "associations" do 
    it { should belong_to(:post).counter_cache(true) }
    it { should belong_to(:user).counter_cache(true) }
  end

  describe "#like_or_unlike!" do 
    context 'liking' do 
      let(:like) { build(:like) }

      it 'saves in db' do 
        like.like_or_unlike!
        expect(like).to be_persisted
      end
    end

    context 'unliking' do 
      let(:like) { create(:like) }

      it 'deletes from db' do 
        like.like_or_unlike!
        expect { like.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
