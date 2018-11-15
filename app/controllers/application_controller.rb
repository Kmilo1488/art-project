class ApplicationController < ActionController::Base

  def index
  end

  def user_role
    current_user.role
  end

  def admin_user
    redirect_to root_path unless user_signed_in? && current_user.role == "admin"
  end

  def collaborator_user
    redirect_to root_path unless user_signed_in? && current_user.role == "collaborator"
  end

end
