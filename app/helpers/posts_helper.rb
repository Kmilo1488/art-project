module PostsHelper

  def form_post
    @post.new_record? ? "New Post" : "Edit Post"
  end

end
