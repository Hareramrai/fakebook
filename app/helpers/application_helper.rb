module ApplicationHelper
  def post_like_link(post)
    like_button = content_tag(:span, '', class: 'glyphicon glyphicon-thumbs-up')  
    liked_count = " #{post.likes.size} Liked"
    link_to (like_button + liked_count), post_likes_path(post), method: :post, remote: true
  end
end
