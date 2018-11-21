module ApplicationHelper

  def current_user_admin?
    user_signed_in? && current_user.role == "admin"
  end

  def current_user_collaborator?
    user_signed_in? && current_user.role == "collaborator"
  end

  def current_user_owner?
    user_signed_in? && current_user.id == @post.owner_id
  end

end
