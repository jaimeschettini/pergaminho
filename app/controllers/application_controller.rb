# encoding = utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  def not_authenticated
	  redirect_to new_user_session_path, :alert => "Você precisa estar logado para acessar esta página."
	end
end
