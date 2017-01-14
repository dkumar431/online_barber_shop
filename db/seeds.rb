# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Slot.destroy_all
Customer.destroy_all 

(10..18).each do |time|
  status = time == 14 ? 0 : 1
  Slot.create(start_time: time, end_time: time+1, status: status)
end

slots = Slot.all.where(status: true).pluck(:id)
dates =  (0..10).map {|x| (Date.today + x).strftime("%Y-%m-%d") }

dates.each do |booking_date|
  slots.sample(4).each do  |slot_id|
    booking = Booking.new(slot_id: slot_id, booking_date: booking_date)
    booking.customer = Customer.new({
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      address: Faker::Address.street_name 
    })    
    booking.save!
  end
end

puts 'Seeded DB with slots, bookings & customers.'
=begin
(0..15).each do
  customer = Customer.new({
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_name })
  booking = Booking.new({slot_id: slots.sample,booking_date: dates.sample})
  booking.customer = customer
  booking.save
end
=end