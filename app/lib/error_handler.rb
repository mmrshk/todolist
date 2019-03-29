module ErrorHandler
  def self.included(clazz)
    clazz.class_eval do
      rescue_from ActiveRecord::RecordNotFound, JWT::DecodeError do |e|
        render json: { message: e.to_s }, status: :unauthorized
      end
    end
  end
end
