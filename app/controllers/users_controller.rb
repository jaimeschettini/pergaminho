# encoding = utf-8

class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.where('id > 1') # all less admin user

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    protect_from_editing_other_users
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'O usuário foi criado com sucesso.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_path, notice: 'O usuário foi atualizado com sucesso.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    respond_to do |format|
      @user = User.find(params[:id])
      if @user.id == User.first.id
        format.html { redirect_to users_path, alert: "O usuário administrador não pode ser removido." }
      else
        @user.destroy
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
    end
  end

  private
  def protect_from_editing_other_users
    if @current_user != @user
      respond_to { |format| format.html { redirect_to users_path, notice: 'Não é possível editar outros usuários.' } }
    end
  end
end
