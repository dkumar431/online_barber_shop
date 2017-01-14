require 'rails_helper'

RSpec.describe Customer, type: :model do
	context 'Test association' do
		it 'should have belongs to association' do
		customer = Customer.reflect_on_association(:booking)
    expect(customer.macro).to eq :has_one
		end

		it 'should have belongs to association with slot' do
			customer = Customer.reflect_on_association(:slot)
			expect(customer.macro).to eq :has_one
		end
	end
end