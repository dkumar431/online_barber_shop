require 'rails_helper'

RSpec.describe BookingsController, type: :controller do

	describe '#index' do
		it 'should render the index action ' do
			get 'index'
			expect(response).to  render_template :index
			expect(assigns(:booking_date)).to eq Date.today
			expect(assigns(:available_slots)).to eq Slot.get_available_slots(Date.today)
		end
	end

	describe '#new' do
		let(:sample_slot) { (1..9).to_a.sample }
		it 'should render the new action' do
			get 'new', slot_id: sample_slot, booking_date: Date.today
			expect(response).to render_template :new
			expect(assigns(:booking).slot_id).to eq sample_slot
			expect(assigns(:booking).booking_date).to eq Date.today
		end
	end

	describe '#create' do
		let(:customer_params) { {"name"=>"ajay", "email"=>"sahu.ajay@gmial.com", "phone"=>"494494949", "age"=>"25", "address"=>"hyb"} }
		let(:booking_params) {{"slot_id"=>"2", "booking_date"=>"2017-01-14"} }
		it 'should create booking & Customer records' do
			customer_size, booking_size = Customer.count, Booking.count
			post 'create', "customer"=> customer_params, "booking"=> booking_params
			expect(Booking.count).to eq booking_size  + 1
			expect(Customer.count).to eq customer_size + 1
			expect(response).to redirect_to confirm_bookings_path
		end
	end
end
