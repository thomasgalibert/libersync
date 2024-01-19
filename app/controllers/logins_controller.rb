class LoginsController < ApplicationController

  def new
    
  end
    
  def show
    user = User.find_by_token_for(:magic_login, params[:token])
    login(user) if user.present?
    redirect_to root_path
  end

  def create
    user = User.find_by(email: params[:email])
    UserMailer.with(user: user).magic_login_email.deliver_later if user.present?
    redirect_to root_path, notice: t('registrations.create.notice')
  end

  def destroy
    logout
    redirect_to root_path
  end
end