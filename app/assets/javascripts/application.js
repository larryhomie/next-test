// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function () {

	//Login Forms modal
	
	$('.loginSignup').contents().hide();

	$('.loginExist a, .loginFromReg').click(function() { //Login from header
		$('.loginSignup').contents().hide();
		$('.loginUser').show();
		$('.loginSignup').modal();
		return false;
	});

	/*$('.registerNew').click(function() { //Register from header

		$('.loginSignup').contents().hide();
		$('.registerUser').show();
		$('.loginSignup').modal();
		return false;

	});

	$('.loginUser a').click(function() { //Retrieve register from login page

		$('.loginSignup').contents().hide();
		$('.registerUser').show();
		return false;
	});*/

	$('.loginUser a:last-child').click(function() { //Retrieve pass from login page

		$('.loginSignup').contents().hide();
		$('.findPassword').show();
		return false;
	});


	/*$('.findPassword a').click(function () { //Login from retrieve pass
		$('.loginSignup').contents().hide();
		$('.registerUser').show();
		return false;
	});*/

	$('.findPassword a:last-child, .registerUser a').click(function () { //Login from retrieve pass
		$('.loginSignup').contents().hide();
		$('.loginUser').show();
		return false;
	});



	//
	$('form#sign_in_user').bind("ajax:beforeSend", function(evt, xhr, settings){
		$('.ajaxLoad').show();
    }).bind('ajax:success', function(e, data, status, xhr) {
	    //console.log(data);
	    if(data.success) {
	      window.location.reload();
	    } else {
	    	$('.ajaxLoad').hide();
	      	$('#failedLogin').html(data.errors);
	    }
	});


});