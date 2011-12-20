var wereWeAtDawg;
function initialize() {

  var myOptions = {
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  
  var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      wereWeAtDawg = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(wereWeAtDawg);
    });
  }
}

function loadScript() {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyDf6lP5i4JT9ubgggrN6sJIpXTf6kYWwPE&sensor=true&callback=initialize";
  document.body.appendChild(script);
}
//window.onload = loadScript;
