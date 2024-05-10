class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :total_rooms, :rooms_left
  has_many :rooms
end