class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :github

  def github
    @user = User.create(provider: auth_hash.provider, uid: auth_hash.uid, email: auth_hash.info.email, password: Devise.friendly_token[0, 20])

    sign_in_and_redirect @user
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end

  def after_sign_in_path_for(user)
    todos_path
  end
end
