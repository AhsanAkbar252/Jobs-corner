class ApplicationController < ActionController::Base
  def authenticate_admin!
  authenticate_user!
  redirect_to "/", alert: 'Not authorized.' unless current_user.admin?
end
end
