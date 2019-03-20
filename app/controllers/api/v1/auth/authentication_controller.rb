class Api::V1::Auth::AuthenticationController < ApplicationController
  before_action :authorize_request, only: %i[logout]

  def login
    begin
      @user = User.find_by_username!(params[:username])
      if @user&.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        time = Time.now + 24.hours.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                       username: @user.username, message: 'You are successfully logged in!'}, status: :ok
      else
        render json: { error: 'Invalid login or password.' }, status: :unauthorized
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def logout
    render json: { username: @current_user.username, message: 'You are successfully logged out!'}, status: :ok
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
