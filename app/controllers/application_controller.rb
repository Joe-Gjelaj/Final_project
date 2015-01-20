class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def can_administer?
    current_user.try(:admin?)
  end

  def after_sign_in_path_for(resource)
  	"/users/#{current_user.id}"
  end

end

