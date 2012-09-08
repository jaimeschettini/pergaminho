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
        if User.count == 1
          redirect_to_create_new_user format
        else
          redirect_back_or_to_home format
        end
      else
        notify_incorrect_credentials format
      end
    end
  end

  def destroy
    logout
    redirect_to(new_user_session_path, :notice => 'A sua sessão foi encerrada.')
  end

  private
  def redirect_back_or_to_home(format)
    format.html { redirect_back_or_to(root_path, :notice => "Olá #{@user.name}. Seja bem-vindo ao Sapienti.") }
  end

  def redirect_to_create_new_user(format)
    format.html { redirect_to(new_user_path, 
            :notice => "Olá #{@user.name}. Seja bem-vindo ao Sapienti. Ainda não existem usuários criados além do administrador. Por favor, crie um para você!") }
  end

  def notify_incorrect_credentials(format)
    format.html { flash.now[:alert] = "Usuário ou senha incorretos."; render :action => "new" }
  end
end
