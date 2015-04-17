class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_only_allowed
    redirect_to('/') if current_user == nil || !current_user.admin 
  end

  def is_owner
    redirect_to('/projects') if current_user == nil || !current_user.owner
  end
end
