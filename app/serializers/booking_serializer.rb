class BookingSerializer < ActiveModel::Serializer
  attributes :id, :check_in, :check_out, :status, :room_id, :user_id

  belongs_to :room
  belongs_to :user
end