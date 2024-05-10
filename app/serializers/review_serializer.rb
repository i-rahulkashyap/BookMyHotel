class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :hotel_id, :rating
end