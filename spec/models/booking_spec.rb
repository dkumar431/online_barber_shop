require 'rails_helper'

RSpec.describe Booking, type: :model do

	context 'Test association' do
		it 'should have belongs to association' do
		booking = Booking.reflect_on_association(:customer)
    expect(booking.macro).to eq :belongs_to
		end

		it 'should have belongs to association with slot' do
			booking = Booking.reflect_on_association(:slot)
			expect(booking.macro).to eq :belongs_to
		end
	end

  describe 'validation' do
    context '#slot_id'  do
      it 'object is valid if slot_id present' do
      end

      it 'object is invalid if slot_id is blank ' do
      end
    end
    context '#booking_date' do
      it 'object is valid if booking_date is present' do
      end
      it 'object is invalid if booking_date is empty' do
      end
    end
    context '#customer' do
    end
  end
end

=begin
validates :slot_id, presence: true
  validates :booking_date, presence: true
  validates_presence_of :customer
=end