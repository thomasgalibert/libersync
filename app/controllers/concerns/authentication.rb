module Authentication
  extend ActiveSupport::Concern

  def authenticate_user!
    redirect_to root_path, alert: t('sessions.unauthenticate') unless user_signed_in?
  end

  def current_user
    Current.user ||= authenticate_user_from_session
  end

  def authenticate_user_from_session
    User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end
  

  def login(user)
    user.touch :last_sign_in_at
    Current.user = user
    reset_session
    session[:user_id] = user.id
  end

  def logout
    Current.user = nil
    reset_session
  end
end