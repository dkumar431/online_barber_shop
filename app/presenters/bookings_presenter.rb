class BookingsPresenter < SimpleDelegator

  include Rails.application.routes.url_helpers
  #include ActionView::Helpers::UrlHelper

  def initialize(view)
    @view = view
  end

  def get_class(slot)
    slot.booking_id? ? 'col-md-3 slot not-available' : 'col-md-3 slot available'
  end

  def get_booking_button(slot,booking_date)
    @view.link_to 'Book', new_booking_path(slot_id: slot.slot_id, booking_date: booking_date), class: "btn btn-success pull-right" if slot.booking_id.blank?
  end

  def format_time(time)
    '%.2f' % time
  end

end