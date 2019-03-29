class Api::V1::Auth::AuthenticationController < ApplicationController
  def login
    user = User.find_by!(username: params[:username])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      time = Time.zone.now + 24.hours.to_i

      render json: { token: token, exp: time.strftime('%m-%d-%Y %H:%M'), username: user.username,
                     message: I18n.t('models.user.authorize') }, status: :ok
    else
      render json: { error: I18n.t('models.user.error') }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
