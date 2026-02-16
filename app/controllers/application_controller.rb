class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.first || User.create!(email: "guest@example.com", encrypted_password: "dummy_password_hash_for_now")
  end

  def authenticate_user!
    # No-op for now as auth is handled elsewhere
    current_user
  end
end
