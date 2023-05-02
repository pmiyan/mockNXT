class Users::SessionsController < Devise::SessionsController
  def destroy
    sign_out
    redirect_to after_sign_out_path_for(:user), allow_other_host: true
  end

  def logout_callback
    reset_session
    redirect_to root_path
  end

  private

  def oauth_provider_logout_url
    base_uri = URI.join(ENV["NXT_APP_URL"], "/oauth/logout")
    base_uri.query = URI.encode_www_form(return_to: logout_callback_url)
    base_uri.to_s
  end

  def after_sign_out_path_for(resource_or_scope)
    oauth_provider_logout_url
  end
end
