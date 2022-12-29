class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logado com sucesso."
    else
      flash.now.alert = "Email or pwd invalid"
      render "new"
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
