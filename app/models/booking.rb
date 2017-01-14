# == Schema Information
#
# Table name: bookings
#
#  id           :integer          not null, primary key
#  customer_id  :integer
#  slot_id      :integer
#  status       :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  booking_date :date
#

class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :slot

  validates :slot_id, presence: true
  validates :booking_date, presence: true
  validates_presence_of :customer
  validate :custom_validation

  def customer_can_not_be_nil
    errors.add(:name, "customer_name can not be null") if self.customer.name.blank?
  end

  def self.fetch_bookings(booking_date = nil)
    Booking.joins("left join customers on customers.id = bookings.customer_id
                    left join slots on slots.id = bookings.slot_id ")
    .select("customers.name,customers.email,customers.phone, slots.id as slot_id, slots.start_time,slots.end_time")
    .where("booking_date = ?",booking_date)
  end

  private
  def custom_validation
    self.errors.add(:base, 'Customer not present') and return false unless self.customer.present?
    self.errors.messages.merge!(self.customer.errors.messages) and return false unless self.customer.valid?
  end



end
