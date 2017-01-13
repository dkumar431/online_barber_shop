class BookingsController < ApplicationController

  def index
    @booking = Booking.new
  end

  def new
    binding.pry
    @booking = Booking.new(slot_id: params[:slot_id])
    @customer = @booking.build_customer
  end

  def search
    @booking_date = params['booking-date']
    @available_slots = Slot.get_available_slots(@booking_date)
    render :index
  end

  def create
    booking = Booking.new(booking_params)
    booking.customer = Customer.new(customer_params)
    if booking.save
      redirect_to root_path(@booking)
    else
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:slot_id)
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :phone, :age, :address)
  end

end