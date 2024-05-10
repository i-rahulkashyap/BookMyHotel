class RoomSerializer < ActiveModel::Serializer
  attributes :id, :room_type, :hotel_id, :room_number, :capacity, :price
end