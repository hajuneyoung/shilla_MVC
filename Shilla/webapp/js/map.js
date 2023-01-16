/*  ---------------------------------------------------
    File Name: map
    Description: contact.jsp - map(google Map API)
    Author: 이미나
---------------------------------------------------------  */
window.onload = function() {
	
	  var hotel = { lat: 37.556672847722666, lng: 126.8219811241314 }
	  var map = new google.maps.Map(document.getElementById("map"), {
	    center: hotel,
	    zoom: 15,
		scrollwheel: false
	  });
		
	  var marker = new google.maps.Marker({
		position: hotel,
		map: map,
		label: {
			text: "신라스테이",
			color: 'red',
			fontSize: "14px"
		},
		icon: {
			url: "../img/icon/icon-marker.png",
			labelOrigin: new google.maps.Point(25,40),
			scaledSize: new google.maps.Size(30,35)
			/*anchor: new google.maps.Point(25,70)*/
		}
	});		
	 
}