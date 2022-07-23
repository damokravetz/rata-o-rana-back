class ApplicationController < ActionController::API
  include Errors

  private

    def param_inclusion?(key, valid_values, allow_blank: true)
      (allow_blank && params[key].blank?) || valid_values.include?(params[key])
    end

    def raise_unprocessable_entity(invalid_key, msg: nil)
      raise Errors::UnprocessableEntity, msg || "Invalid '#{invalid_key.to_s}'"
    end
end
