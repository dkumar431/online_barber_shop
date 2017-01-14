class BookingsController < ApplicationController

  def index
    @booking = Booking.new
    @booking_date = Date.today
    @available_slots = Slot.get_available_slots(@booking_date)
    @bookings_presenter  = BookingsPresenter.new
  end

  def new
    @booking = Booking.new(slot_id: params[:slot_id], booking_date: params[:booking_date])
    @customer = @booking.build_customer
  end

  def create
    booking = Booking.new(booking_params)
    booking.customer = Customer.new(customer_params)
    if booking.save
      redirect_to confirm_bookings_path
    else
    end
  end

  def show
    redirect_to root_path if(params[:id] == 'search')

  end

  def search
    @booking_date = params['booking-date']
    @available_slots = Slot.get_available_slots(@booking_date)
    # raise @available_slots.map(&:booking_id).inspect
    @bookings_presenter  = BookingsPresenter.new
    render :index
  end

  def confrim
    #send email
  end

  def bookings_by_date
  end

  def fetch
    @bookings = Booking.fetch_bookings(params['booking-date'])
  end

  private
  def booking_params
    params.require(:booking).permit(:slot_id,:booking_date)
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :phone, :age, :address)
  end

end