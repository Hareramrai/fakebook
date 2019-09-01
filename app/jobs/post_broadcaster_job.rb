class PostBroadcasterJob < ApplicationJob
  queue_as :default

  def perform(post)
    ActionCable.server.broadcast "posts", { post: render_post(post) }
  end

  private

  def render_post(post)
    PostsController.render(partial: 'post', locals: { post: post}).squish
  end
end