class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

  class << self
    def encode(payload)
      payload[:exp] = 24.hours.from_now.to_i
      JWT.encode(payload, SECRET_KEY)
    end

    def decode(token)
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new decoded
    end
  end
end
