class UsersController < ApplicationController
 before_action :authenticate_user!

  def index
    render json: User.all, each_serializer: UserSerializer
  end
end
