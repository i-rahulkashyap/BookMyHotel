
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :current_sign_in_at
end


