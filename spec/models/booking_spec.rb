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
end
