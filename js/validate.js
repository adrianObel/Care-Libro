// 
//	jQuery Validate example script
//
//	Prepared by David Cochran
//	
//	Free for your use -- No warranties, no guarantees!
//

$(document).ready(function(){

	// Validate
	// http://bassistance.de/jquery-plugins/jquery-plugin-validation/
	// http://docs.jquery.com/Plugins/Validation/
	// http://docs.jquery.com/Plugins/Validation/validate#toptions
	
		$('#validate_form').validate({
	    rules: {
	      name: {
	        minlength: 2,
	        required: true
	      },
		  lstname: {
	        minlength: 2,
	        required: true
	      },
	      mail: {
	        required: true,
	        email: true
	      },
		  remail: {
	        required: true,
			equalTo: "#mail"
	      },
		  password_field: {
	        minlength: 8,
	        required: true
	      },
		  repassword_field: {
	        required: true,
			equalTo: "#password_field"
	      },
		  sex: {
	        required: true
	      },
		  year: {
	        required: true
	      },
		  
		  
	    },
	    highlight: function(label) {
	    	$(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('Wohoo! Continua!').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
	  });
	  
}); // end document.ready