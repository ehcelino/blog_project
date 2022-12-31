class SessionsController < ApplicationController
  # ignora a checagem de timeout neste controller
  # skip_before_action :check_timeout

  def new
    
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      if params[:from_url]
        redirect_to params[:from_url]
      else
        redirect_to root_path
      end
    else
      flash[:danger] = 'Usuário/senha inválidos.'
      # era pra funcionar com render 'new', mas só dá
      # parcialmente certo com redirect_to new_session_url
      # render 'new'
      redirect_to new_session_url
    end
  end
  
  # def destroy
  #   session[:user_id] = nil
  #   redirect_to root_url
  # end

  def show
    # session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to root_url
  end

end
