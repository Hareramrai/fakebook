require 'rails_helper'

RSpec.describe 'Posts Controller', type: :request do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3) }
  let(:first_post) { posts.first }

  describe 'GET /posts with valid session' do
    before { login_as(user, :scope => :user)  }

    it 'returns status code 200' do
      get posts_url
      expect(response).to have_http_status(200)
    end

    it 'returns posts' do
      get posts_url
      expect(response).to render_template(:index)
      expect(response.body).to include(first_post.title)
    end
  end

  describe 'POST /posts with valid session' do
    before { login_as(user, :scope => :user)  }

    describe 'when the request is valid' do
      context 'without image' do 
        let(:valid_attributes) { { post: attributes_for(:post, user_id: user.id) } }

        before { post posts_path, params: valid_attributes }

        it 'creates a post and redirect to list' do
          expect(response).to redirect_to(posts_url)
          follow_redirect!
          expect(response).to render_template(:index)
          expect(response.body).to include("Your post has been created.")
        end
      end 

      context 'with image' do
        let(:images) { { images: [Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/logo.png"))] } }
        let(:valid_attributes) { { post: attributes_for(:post, user_id: user.id).merge(images) } }

        before { post posts_path, params: valid_attributes }

        it 'creates a post and redirect to list' do
          expect(response).to redirect_to(posts_url)
          follow_redirect!
          expect(response.body).to include("Your post has been created.")

          newly_created_post = Post.latest.first
          expect(newly_created_post.photos).to be_present
        end
      end
    end
  end
end