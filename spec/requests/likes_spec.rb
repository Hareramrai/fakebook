require 'rails_helper'

RSpec.describe 'Likes Controller', type: :request do
  let!(:user) { create(:user) }
  let!(:unliked_post) { create(:post) }

  describe 'POST /posts/:post_id/likes with valid session' do
    before { login_as(user, :scope => :user)  }

    describe 'when the request is valid' do
      before { post post_likes_path(unliked_post, format: :js), params: {} }

      it 'creates a like for a post' do
        expect(unliked_post.likes).to be_present
        expect(response.body).to include("1 Liked")
      end
    end 
  end
end