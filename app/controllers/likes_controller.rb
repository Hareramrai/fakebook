class LikesController < ApplicationController

  def create
    like = current_user.likes.where(post_id: params[:post_id]).first_or_initialize
    @post = like.post 
    
    like.like_or_unlike!

  end

end
