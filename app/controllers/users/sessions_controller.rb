# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    super do |user|
      user.update!(current_sign_in_at: Time.current)
    end
 end
 

  private

  def respond_with(resource, _opts = {})
    if resource.nil?
      render json: { 
        status: {code: 401, message: "Not logged in."},
      }, status: :unauthorized
    else
      render json: { 
        status: {code: 200, message: "Logged in successfully."},
        data: ActiveModelSerializers::SerializableResource.new(resource, each_serializer: UserSerializer, adapter: :attributes).as_json
      }, status: :ok
    end
  end


  def respond_to_on_destroy
    if current_user
      render json: { 
        status: 200 , 
        message: "Logged out successfully.",
     }, status: :ok
    else
      render json: { 
        status: 401 , 
        message: "Couldn't find an active session.",
     }, status: :unauthorized
    end
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
