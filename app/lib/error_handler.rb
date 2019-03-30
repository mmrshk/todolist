module ErrorHandler
  def self.included(clazz)
    clazz.class_eval do
      rescue_from JWT::DecodeError do |e|
        render json: { message: e.to_s }, status: :unauthorized
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { message: e.to_s }, status: :not_found
      end
    end
  end
end
