class SessionsController < ApplicationController
  skip_before_action :check_timeout
  def new
    
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if params[:from_url]
        redirect_to params[:from_url]
      else
        redirect_to root_path
      end
    else
      flash[:danger] = 'Email/senha inválidos.'
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
    session[:user_id] = nil
    redirect_to root_url
  end

end
