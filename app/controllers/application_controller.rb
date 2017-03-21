class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def require_admin
    unless current_user && current_user.admin?
      flash[:error] = t("devise.failure.restrict_to_admin")
      redirect_to root_path
    end        
  end
  
end
