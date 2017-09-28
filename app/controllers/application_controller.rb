class ApplicationController < ActionController::Base
  include Pundit
  # after_action :verify_authorized
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :error

  def not_authenticated
    redirect_to new_session_url, error: 'You need to login to see that page.'
  end
end
