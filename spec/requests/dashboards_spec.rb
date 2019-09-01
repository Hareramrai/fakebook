require 'rails_helper'

RSpec.describe 'Dashboards', type: :request do
  let!(:user) { create(:user, first_name: 'Hare', last_name: 'Ram') }
  let!(:post) { create(:post, user: user, title: 'my title') }
  let!(:like) { create(:like, user: user, post: post) }

  describe 'GET /dashboards with valid session' do
    before { login_as(user, :scope => :user)  }

    it 'returns status code 200' do
      get dashboards_path
      expect(response).to have_http_status(200)
    end

    it 'generates pie chart with stats' do
      get dashboards_path
     
      expect(assigns(:users)).to eq([user])
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe 'GET /dashboards/currently_loggedin with valid session' do
    before { 
      user.update(logged_in: true) 
      login_as(user, :scope => :user)
    }

    it 'returns status code 200' do
      get currently_loggedin_dashboards_path
      expect(response).to have_http_status(200)
    end

    it 'generates list of logged_in user' do
      get currently_loggedin_dashboards_path
     
      expect(assigns(:users)).to eq([user])
      expect(response.body).to include(user.name)
    end
  end

  describe 'GET /dashboards/post_likes with valid session' do
    let!(:user1) { create(:user) }
    let!(:like1) { create(:like, user: user1, post: post) }

    before { login_as(user, :scope => :user) }

    it 'returns status code 200' do
      get post_likes_dashboards_path
      expect(response).to have_http_status(200)
    end

    it 'generates list of post by order of most likes' do
      get post_likes_dashboards_path
     
      expect(assigns(:posts)).to eq([post])
      expect(response.body).to include(post.title)
      expect(response.body).to include(post.likes_count.to_s)
    end
  end
end