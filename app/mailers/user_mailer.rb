class UserMailer < ApplicationMailer

  def magic_login_email
    @user = params[:user]
    mail to: @user.email
  end
end
