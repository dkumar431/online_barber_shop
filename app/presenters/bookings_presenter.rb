class BookingsPresenter < SimpleDelegator
  def initialize
  end

  def current_date
    Date.today
  end

  def get_class(slot)
    slot.booking_id? ? 'col-md-3 slot not-available' : 'col-md-3 slot available'
  end

  def get_available_slots(current_action, booking_date)
    # raise current_action.inspect
    # binding.pry
    # raise booking_date.inspect
    @available_slots = current_action == 'index' ?  [Slot.get_available_slots(Date.today), Date.today]  : [Slot.get_available_slots(booking_date), booking_date]
     # [Slot.get_available_slots(Date.today), Date.today]

  end
end