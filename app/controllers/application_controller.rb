class ApplicationController < ActionController::API
    # before_action :authenticate_request
    rescue_from StandardError, with: :handle_standard_error

    private
    def authenticate_request
        auth_header = request.headers['Authorization']
        if !auth_header
          render json: { error: 'Authorization header is missing' }, status: :unauthorized
        end
      end
    def handle_standard_error(e)
        render json: { error: e.message }, status: :internal_server_error
    end
end
