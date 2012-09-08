# encoding = utf-8

class UserSessionsController < ApplicationController
  layout "login"

  skip_before_filter :require_login, :except => [:destroy]

  
  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      if @user = login(params[:username],params[:password])
        format.html { redirect_back_or_to(root_path, :notice => "Olá #{@user.name}. Seja bem-vindo ao Sapienti.") }
      else
        format.html { flash.now[:alert] = "Usuário ou senha incorretos."; render :action => "new" }
      end
    end
  end

  def destroy
    logout
    redirect_to(new_user_session_path, :notice => 'A sua sessão foi encerrada.')
  end
end
