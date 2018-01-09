class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # Redirect to courses path on sign in
  def after_sign_in_path_for(resource_or_scope)
    courses_path
  end
end
