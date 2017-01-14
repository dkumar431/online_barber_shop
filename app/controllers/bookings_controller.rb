class BookingsController < ApplicationController

  def index
    @booking = Booking.new
    @booking_date = Date.today
    @available_slots = Slot.get_available_slots(@booking_date)
    @bookings_presenter  = BookingsPresenter.new(view_context)
  end

  def new
    @booking = Booking.new(slot_id: params[:slot_id], booking_date: params[:booking_date])
    @customer = @booking.build_customer

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.customer = Customer.new(customer_params)
    if @booking.valid?
      @booking.save
      redirect_to confirm_bookings_path
    else
      render :new
    end
  end

  def show
    redirect_to root_path if(params[:id] == 'search')
    redirect_to bookings_list_bookings_path if params[:id] == 'fetch_all_bookings'
  end

  def search
    @booking_date = params['booking-date']
    @available_slots = Slot.get_available_slots(@booking_date)
    @bookings_presenter  = BookingsPresenter.new(view_context)
    render :index
  end

  def confirm
  end

  def bookings_list
    @booking_date = Date.today
  end

  def fetch_all_bookings
    @booking_date = params['booking-date']
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