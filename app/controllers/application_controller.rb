class ApplicationController < ActionController::Base
  add_flash_types :notice, :alert

  def index
  end

  def user_role
    current_user.role
  end

  def admin_user
    user_signed_in? && current_user.role == "admin"
  end

  def collaborator_user
    user_signed_in? && current_user.role == "admin" || "collaborator"
  end

  def post_owner
    @post = Post.find(params[:id])
    @post.owner_id == current_user.id
  end

end
