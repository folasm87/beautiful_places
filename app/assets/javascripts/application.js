// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var geocoder;
var map;
function initialize() {

	google.maps.visualRefresh = true;

	geocoder = new google.maps.Geocoder();

	var mapOptions = {
		center : new google.maps.LatLng(-34.397, 150.644),
		zoom : 2,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};

	map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

	$.getJSON('../places.json', function(data) {

		$.each(data, function(key, val) {

			codeAddress(val);
		});

	});

}

function codeAddress(addr) {
	var address = addr;
	/* document.getElementById('address').value;*/
	//alert(address);
	geocoder.geocode({
		'address' : address
	}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			//map.setCenter(results[0].geometry.location);

			//https://www.googleapis.com/customsearch/v1?key=AIzaSyBSP7DBzAh-_YxOWF270KAPgHZtwYoUxBE&cx=002605916911289929646:xfgky2opaiu&q=Tsaranoro, Andringitra, Madagascar&imgType=photo&alt=json&safe=high&fields=item(pagemap(cse_image/src))

			var imageJSON = 'https://www.googleapis.com/customsearch/v1?key=AIzaSyBSP7DBzAh-_YxOWF270KAPgHZtwYoUxBE&cx=002605916911289929646:xfgky2opaiu&q=';
			imageJSON += address + '&imgType=photo&alt=json&safe=high&fields=items(pagemap(cse_image/src))';

			var infowindow;
			var picGallery = '<h1 id="firstHeading" class="firstHeading">' + address + '</h1><div class="Collage fotorama">';
			$.getJSON(imageJSON, function(data) {

				// alert("bo bo");
				//alert(data.items);
				$.each(data.items, function(key, val) {//items

					//alert("one piece");
					//alert("The key of "+ val.valueOf() + "is ** " + key);
					//var obj = $.parseJSON(JSON.stringify(val));
					//	 console.log(obj);
					$.each(val, function(key2, val2) {//pagemap

						var contentString = '<img src="';
						// var obj2 = $.parseJSON(JSON.stringify(val2));
						//console.log(obj2);
						// console.log("This is key2: " + key2);
						$.each(val2, function(key3, val3) {//cse_image

							//var obj3 = $.parseJSON(JSON.stringify(val3));
							//console.log(obj3);
							//console.log(key3);

							$.each(val3, function(key4, val4) {//src

								//console.log(val4["src"]);

								contentString += val4["src"] + '"></img>';
								//console.log("contentString is " + contentString);

								picGallery += contentString;
								console.log('picGallery in innermost loop is: ' + picGallery);

							});

							return false;
						});
						//contentString += val2;
						//alert("echo");
						//alert(val2);
						//console.log("contentString during parsing  is :  " + contentString);
						//return false;
					});

					//return false;

					//codeAddress(val);
				});

				picGallery += '</div>';
				alert(picGallery);
				$('.Collage').collagePlus();
				//console.log('picGallery is: ' + picGallery);
				infowindow = new google.maps.InfoWindow({
					content : picGallery
				});

				//contentString += '"></img>';
			});

			//http://api.wikilocation.org/articles?lat=51.500688&lng=-0.124411&limit=1

			var lat = results[0].geometry.location.lat();
			var lng = results[0].geometry.location.lng();

			var marker = new google.maps.Marker({
				map : map,
				position : results[0].geometry.location,
				title : address
			});

			google.maps.event.addListener(marker, 'click', function() {
				infowindow.open(map, marker);
			});
		} else {
			alert('Geocode was not successful for the following reason: ' + status);
		}
	});
}

function storeAddress() {
	var address = document.getElementById('address').value;
	var tempValue = {
		"address" : address
	};

	var jsonValue = JSON.stringify(tempValue);

	$.each(places, function(key, val) {
		// do something with key and val

	});

}

google.maps.event.addDomListener(window, 'load', initialize); 