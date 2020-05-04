module PostsHelper
  def like_button(post_id: post_id, account_id: account_id)
    liked = Like.exists?(post_id: post_id, account_id: account_id)
    icon_type = liked ? 'fas' : 'far'
    icon_class = 'fa-lg post-like'
    icon_class << ' liked' if liked
    icon(icon_type, 'heart', class: icon_class, 'data-id': post_id)
  end
end
