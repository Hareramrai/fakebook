class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user, :photos).latest
  end

  def create
    @post =
      PostService::Create.new.call(
        params.require(:post).to_unsafe_hash, current_user
      )

    if @post.valid?
      PostBroadcasterJob.perform_later(@post) 
      flash[:notice] = "Your post has been created."
    else
      flash[:alert] = "Something went wrong."
    end

    redirect_to posts_path
  end

end
