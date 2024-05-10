# app/models/booking.rb
class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :check_in, :check_out, presence: true
  validates :guests, presence: true, numericality: { only_integer: true, greater_than: 0 }
  before_validation :set_default_status, :check_in_before_check_out, if: :new_record?

  scope :upcoming_bookings, -> { where(status: 'upcoming') }
  scope :ongoing_bookings, -> { where(status: 'ongoing') }
  scope :completed_bookings, -> { where(status: 'completed') }
  scope :cancelled_bookings, -> { where(status: 'cancelled') }

  private

  def set_default_status
    
    if self.check_in > Date.today
      self.status = 'upcoming'
    elsif self.check_out < Date.today
      self.status = 'completed'
    else
      self.status = 'ongoing'
    end
  end

  def check_in_before_check_out
    errors.add(:check_out, "must be after check-in") if check_out <= check_in
  end

end
