class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Loga automaticamente o usuário
      session[:user_id] = @user.id
      cookies[:auth_token] = @user.auth_token
      flash[:notice] = "Logado com sucesso."
      redirect_to root_url
    else
      render "new"
    end
  end

  def index
    @users = User.all
  end


  private
  def user_params
    params.require(:user).permit(:auth_token, :username, :email, :password)
  end
  
end
