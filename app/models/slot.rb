# == Schema Information
#
# Table name: slots
#
#  id         :integer          not null, primary key
#  start_time :float
#  end_time   :float
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Slot < ActiveRecord::Base
  
  def self.get_available_slots(booking_date)
    Slot.joins("LEFT JOIN BOOKINGS ON SLOTS.ID = BOOKINGS.SLOT_ID and bookings.booking_date = booking_date")
      .select("SLOTS.ID as slot_id,SLOTS.START_TIME,SLOTS.END_TIME,BOOKINGS.ID as booking_id")
      #.where("bookings.booking_date = booking_date")
  end
  
end
