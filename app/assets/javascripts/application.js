// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require bootstrap
//= require_tree .




$(document).on('ready', function(){
    performBooking();
});


function performBooking() {

  $('#search_results').on('click', '.slot', function(){
    var slot_id = $(this).attr("slot_id");
    var booking_date = $("#barber-picker").val();
    
    $.ajax('/bookings/new', {
      data: { slot_id : slot_id, booking_date: booking_date },
      success: function(data) {  
      },
      error: function(e) {
        console.log(e);
      }
    });
  });
}