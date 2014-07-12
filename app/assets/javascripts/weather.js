// // api.openweathermap.org/data/2.5/weather?lat=35&lon=139

// window.onload=function(){

//   http://api.openweathermap.org/data/2.5/weather?q=London

// }

// http://api.wunderground.com/api/09e2c9e3b58bf74d/geolookup/q/37.776289,-122.395234.json

  var lat;
  var lon;

function getWeather(){

  function callback(position) {
    lat = position.coords.latitude;
    lon = position.coords.longitude;


    $.ajax({
      url : "http://api.wunderground.com/api/09e2c9e3b58bf74d/conditions/geolookup/q/"+lat+","+lon+".json", //
      dataType : "jsonp",
      async: false,
      success : function(parsed_json) {
        var location = parsed_json['location']['city'];
        var temp_f = parsed_json['current_observation']['temp_f'];
        var weather = parsed_json['current_observation']['weather']
        var weathericon = parsed_json['current_observation']['icon_url']
        var feeltemp = parsed_json['current_observation']['feelslike_string']
        $('#weather-info').append($('<div>').attr('class', 'weather-info'));
        $('.weather-info').text(location+" "+temp_f+" "+feeltemp+" "+ weather); // formatting needs fixing
        // $('.weather-info').text("(f)"+temp_f);
        // $('.weather-info').text("feels like: "+feeltemp);
        // $('.weather-info').text(weather);
        $('.weather-info').append($('<img>').attr('src', weathericon));
        $('input[data-name="lat"]').val(lat);
        $('input[data-name="lon"]').val(lon);
        $('input[data-name="weather"]').val(temp_f);
        $('input[data-name="weather_con"]').val(weather);

        // add date to form for now
        $('input[data-name="date"]').val(new Date());
      }
    });
  }

  navigator.geolocation.getCurrentPosition(callback);

}

$(function(){
  getWeather();
});
