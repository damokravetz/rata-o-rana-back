class ApplicationController < ActionController::API
  rescue_from Errors::ApiError do |e| render_error(e) end

  private

    def param_inclusion?(key, valid_values, allow_blank: true)
      (allow_blank && params[key].blank?) || valid_values.include?(params[key])
    end

    def raise_unprocessable_entity(invalid_key, msg: nil)
      raise Errors::UnprocessableEntity.new(msg || "Invalid '#{invalid_key.to_s}'")
    end

    def render_error(e)
      render json: { error: e.message }, status: e.status
    end
end
