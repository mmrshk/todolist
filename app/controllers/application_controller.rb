class ApplicationController < ActionController::API
  attr_reader :current_user
  include ErrorHandler

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    @current_user = User.find(JsonWebToken.decode(header)[:user_id])
  end
end
