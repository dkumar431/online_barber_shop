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
end
