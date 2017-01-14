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
    let(:booking) { Booking.new(slot_id: 5, booking_date: Date.today) }
    let(:customer) {
      Customer.new(name: 'Johnson', phone: '282-393-4945',email: 'johnson@gmail.com', address: 'LOC', age: 26)
    }
    before(:each) do
      booking.customer = customer
    end
    context '#slot_id'  do
      it 'object is valid if slot_id present' do
        expect(booking).to be_valid
      end

      it 'object is invalid if slot_id is blank ' do
        booking.slot_id = nil
        expect(booking).not_to be_valid
        expect(booking).to have(1).errors_on(:slot_id)
      end
    end
    context '#booking_date' do
      it 'object is valid if booking_date is present' do
        expect(booking).to be_valid
      end
      it 'object is invalid if booking_date is empty' do
        booking.booking_date = nil
        expect(booking).not_to be_valid
        expect(booking).to have(1).errors_on(:booking_date)
      end
    end
    context '#customer' do
      it 'object is valid if customer is present' do
        booking.customer = customer
        expect(booking).to be_valid
      end
      it 'object is invalid if customer is absent' do
        booking.customer = nil
        expect(booking).not_to be_valid
        expect(booking).to have(1).errors_on(:customer)
      end
    end
  end
end