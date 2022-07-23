module Errors
  extend ActiveSupport::Concern

  included do
    rescue_from Errors::ApiError do |e| render_error(e) end
    # rescue_from ActiveRecord::RecordNotFound do |e| render_error(NotFound.new(e.message)) end
  end

  def render_error(e)
    render json: { error: e.message }, status: e.status
  end

  class ApiError < StandardError
    def status
      :internal_server_error
    end
  end

  class UnprocessableEntity < ApiError
    def status
      :unprocessable_entity
    end
  end

  class NotFound < ApiError
    def status
      :not_found
    end
  end
end
