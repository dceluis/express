class ApplicationController < ActionController::Base
  include Pundit
  # after_action :verify_authorized
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :error

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  private

  def not_authenticated
    redirect_to new_session_url, error: 'You need to login to see that page.'
  end

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
