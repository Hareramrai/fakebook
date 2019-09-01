require 'rails_helper'

RSpec.describe PostBroadcasterJob, type: :job do
  let(:post) { create(:post) }

  describe '.perform' do
    let(:post_html) { PostsController.render(partial: 'post', locals: { post: post}).squish }
    
    it 'broadcast post to posts channel' do
      expect { PostBroadcasterJob.perform_now(post) }.to have_broadcasted_to("posts").with(post: post_html)
    end
  end
end