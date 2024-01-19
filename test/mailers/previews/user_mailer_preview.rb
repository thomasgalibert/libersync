# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/magic_login_email
  def magic_login_email
    UserMailer.with(user: User.last).magic_login_email
  end

end
