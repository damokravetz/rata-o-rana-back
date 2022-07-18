class Errors
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
end
