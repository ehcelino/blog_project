class ApplicationController < ActionController::Base
  before_action :check_timeout

  def check_timeout
    timeout_period = 1.minutes
    if current_user && session[:last_request_at] && session[:last_request_at] < timeout_period.ago
      # current_user = nil
      # reset_session
      session[:user_id] = nil
      redirect_to new_session_path, alert: "Sua sessão foi finalizada. Por favor faça login novamente."
    else
      session[:last_request_at] = Time.current
    end
  end

private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end

def authorize
  redirect_to new_session_url if current_user.nil?
end