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

  def self.fetch_bookings(booking_date = nil)
    Booking.joins("left join customers on customers.id = bookings.customer_id
                    left join slots on slots.id = bookings.slot_id ")
    .select("customers.name,customers.email,customers.phone, slots.id as slot_id, slots.start_time,slots.end_time") #.where()
  end



end
