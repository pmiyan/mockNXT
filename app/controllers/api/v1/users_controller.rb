class Api::V1::UsersController < ApplicationController
  before_action :authenticate_server

  def index
    users = User.all
    user_info = users.map do |user|
      access_enabled = user.access_enabled
      app = "MockNXT"
      average_minutes_used_last_30_days = user.average_minutes_used_last_30_days
      fees_last_30_days = user.fees_last_30_days.to_f
      user_type = user.user_type
      initial_access = user.created_at.strftime("%Y-%m-%d")
      last_access = user.last_access.strftime("%Y-%m-%d")
      created_at = user.created_at.strftime("%Y-%m-%d")
      updated_at = user.updated_at.strftime("%Y-%m-%d")
      {
        id: user.id,
        name: user.name,
        email: user.email,
        access_enabled: access_enabled,
        app: app,
        user_type: user_type,
        location: user.location,
        average_minutes_used_last_30_days: average_minutes_used_last_30_days,
        fees_last_30_days: fees_last_30_days,
        initial_access: initial_access,
        last_access: last_access,
        created_at: created_at,
        updated_at: updated_at
      }
    end

    render json: user_info
  end

  def authenticate_server
  end
end
