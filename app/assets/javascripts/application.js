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
//= require turbolinks
//= require_tree .


//= require bootstrap-datepicker

//= require moment
//= require daterangepicker

$(document).ready(function(){
	var availableDates = $('#available_dates').data('dates');
    // debugger
    var function_d = {
            format:  'dd/mm/yyyy',
            beforeShowDay: function(date){
                console.log('cheking date')
                // debugger
                dmy = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
                if($.inArray(dmy,availableDates) != -1){
                    console.log('enabled')
                    return {
                        enabled : true
                    }
                }else{
                    console.log('disabled')
                    return {
                        enabled : false
                    }
                }
            }
        }


    	$('#reservation_start_date').datepicker(function_d);
        $('#reservation_end_date').datepicker(function_d);


	$('#listing_available_dates_start_date,#listing_available_dates_end_date').datepicker({
        format:  'dd/mm/yyyy',
     });

})

