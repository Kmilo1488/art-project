class ApplicationController < ActionController::Base

  def index
  end

  def user_role
    current_user.role
  end

end
