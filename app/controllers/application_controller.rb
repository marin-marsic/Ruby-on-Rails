class ApplicationController < ActionController::Base
	before_filter :log_activity
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper


def log_activity
	if not current_user.nil? then
	current_user.activity = Time.now
	current_user.save
end
end
end
