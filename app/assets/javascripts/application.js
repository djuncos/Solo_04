// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require turbolinks
//= require jquery_ujs
//= require_tree



		function distance(lat1,long1,lat2,long2){
		    var R = 6371e3; // metres
		    var φ1 = lat1*Math.PI/180;
		    var φ2 = lat2*Math.PI/180;
		    var Δφ = (lat2-lat1)*Math.PI/180;
		    var Δλ = (long2-long1)*Math.PI/180;
		    var a = Math.sin(Δφ/2) * Math.sin(Δφ/2) +
		        Math.cos(φ1) * Math.cos(φ2) *
		        Math.sin(Δλ/2) * Math.sin(Δλ/2);
		    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		    var d = R * c;
		    return d
	  	}
	 
 


$("document").ready(function(){





   	
   



	

	




	
})


