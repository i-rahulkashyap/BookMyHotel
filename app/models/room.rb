class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, dependent: :destroy


  validates :room_number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :room_type, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
