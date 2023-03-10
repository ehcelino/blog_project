class ApplicationController < ActionController::Base
  before_action :check_timeout
  before_action :current_user


  def check_timeout
    timeout_period = 10.minutes
    if current_user && session[:last_request_at] && session[:last_request_at] < timeout_period.ago
      # current_user = nil
      # reset_session
      # session[:user_id] = nil
      cookies.delete(:auth_token)
      redirect_to new_session_path(previous_url: (root_url + request.path)), alert: "Sua sessão foi finalizada. Por favor faça login novamente."
    else
      session[:last_request_at] = Time.current
    end
  end

private
  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user
end

def authorize
  redirect_to new_session_url if current_user.nil?
end