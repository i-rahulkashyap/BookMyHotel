class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :name, uniqueness: { scope: :address, message: "and address combination already exists" }
end
