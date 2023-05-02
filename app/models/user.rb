class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:events360]

  def self.from_omniauth(auth)
    # User.find_or_create_by(email: auth.info.email) do |user|
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email          = auth.info.email
      user.password       = Devise.friendly_token[0,20]
      user.name           = auth.info.name
      user.initial_access = Time.now
      user.last_access    = Time.now
    end
  end

  def update_events360_credentials(auth)
    update(
      app_access_token: auth.credentials.token,
      app_refresh_token: auth.credentials.refresh_token,
      app_expires_at: Time.at(auth.credentials.expires_at)
    )
  end

  def self.events360_oauth_client
    @events360_oauth_client ||= OAuth2::Client.new(
      ENV.fetch("NXT_APP_ID"),
      ENV.fetch("NXT_APP_SECRET"),
      site: ENV.fetch("NXT_APP_URL")
    )
  end

  def events360_access_token_raw
    OAuth2::AccessToken.new(
      User.events360_oauth_client, app_access_token, expires_at: app_expires_at, refresh_token: app_refresh_token
    )
  end

  def events360
    @events360 ||= events360_access_token_raw
    if @events360.expired?
      @events360 = @events360.refresh!
      update app_refresh_token: @events360.refresh_token, app_expires_at: @events360.expires_at, app_access_token: @events360.token
    end
    @events360
  end
end

