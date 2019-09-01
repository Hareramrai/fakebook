class DashboardsController < ApplicationController
  
  def index
    @users = User.all
    @posts = Post.all 
  end

  def currently_loggedin
    @users = User.logged_in_users
  end

  def post_likes
    @posts = Post.includes(:user).order(likes_count: :desc)
  end
end
