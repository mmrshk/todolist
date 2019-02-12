class Api::V1::Auth::SignupController < ApplicationController
  # POST /users
  # POST /users.json
  api :POST, "/register", "Create an user"
  param :username, String, "Username", required: true
  param :password, String, "Password", required: true
  param :password_confirmation, String, "Password confiramtion", required: true

  def create
    user = User.new(user_params)

    if user.save
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login

      response.set_cookie(JWTSessions.access_cookie, value: tokens[:access], httponly: true, secure: Rails.env.production?)
      render json: { csrf: tokens[:csrf] }
    else
      render json: { error: user.errors.full_messages.join(' ') }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
