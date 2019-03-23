class Api::V1::Auth::AuthenticationController < ApplicationController
  before_action :authorize_request, only: %i[logout]

  def login
    begin
      user = User.find_by!(username: params[:username])

      if user&.authenticate(params[:password])
        render json: user.authorize, status: :ok
      else
        render json: { error: 'Invalid login or password.' }, status: :unauthorized
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def logout
    render json: { username: @current_user.username, message: 'You are successfully logged out!' }, status: :ok
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
