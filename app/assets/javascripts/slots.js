$(document).ready(function(){
    $('.datepicker').datepicker();
    $('.datepicker').on("change",function(){
        $.ajax('/slots/available_slots', {
            success: function(data) {
               
            },
            error: function() {
                
            }
        });
    });

    
})