 import 'package:flutter/material.dart';

class WeatherModel{
   final DateTime time;
   final String weatherStateName;
   final double avgTemp;
   final double maxTemp;
   final double minTemp;


   WeatherModel( {
     required this.time,
     required this.avgTemp,
     required this.weatherStateName,
     required this.maxTemp,
     required this.minTemp,


 });
   factory WeatherModel.fromJson(dynamic data){
       final jsonData =data["forecast"]["forecastday"][0]["date"];
         return WeatherModel(
          time:DateTime.parse(data["current"]["last_updated"]),
           weatherStateName: jsonData["condition"]["text"],
           maxTemp: jsonData["maxtemp_c"],
           avgTemp:jsonData["avgtemp_c"],
           minTemp: jsonData["mintemp_c"]
       ) ;
}
@override
String toString(){
     return "  avgTemp  $avgTemp maxTemp $maxTemp  minTemp $minTemp";
}


   String getImage() {
     switch (weatherStateName) {
       case 'Sunny':
       case 'Clear':
       case 'Partly cloudy':
         return 'assets/images/clear.png';

       case 'Blizzard':
       case 'Patchy snow possible':
       case 'Patchy sleet possible':
       case 'Patchy freezing drizzle possible':
       case 'Blowing snow':
       case 'Patchy light snow':
       case 'Light snow':
       case 'Patchy moderate snow':
       case 'Moderate snow':
       case 'Patchy heavy snow':
       case 'Heavy snow':
       return   'assets/images/snow.png';

       case 'Freezing fog':
       case 'Fog':
       case 'Mist':
       case 'Overcast':
       case 'Cloudy':
         return 'assets/images/cloudy.png';

       case 'Patchy rain possible':
       case 'Patchy light rain':
       case 'Light rain':
       case 'Moderate rain at times':
       case 'Moderate rain':
       case 'Heavy rain at times':
       case 'Heavy rain':
       case 'Light rain shower':
       case 'Moderate or heavy rain shower':
       case 'Torrential rain shower':
         return 'assets/images/rainy.png';

       case 'Thundery outbreaks possible':
       case 'Patchy light rain with thunder':
       case 'Moderate or heavy rain with thunder':
       case 'Patchy light snow with thunder':
       case 'Moderate or heavy snow with thunder':
         return 'assets/images/thunderstorm.png';

       default:
         return 'assets/images/rainy.png';
     }
   }

   MaterialColor getThemeColor() {
     switch (weatherStateName) {
       case 'Sunny':
       case 'Clear':
       case 'Partly cloudy':
         return Colors.orange;

       case 'Blizzard':
       case 'Patchy snow possible':
       case 'Patchy sleet possible':
       case 'Patchy freezing drizzle possible':
       case 'Blowing snow':
       case 'Patchy light snow':
       case 'Light snow':
       case 'Patchy moderate snow':
       case 'Moderate snow':
       case 'Patchy heavy snow':
       case 'Heavy snow':
         return Colors.blue;

       case 'Freezing fog':
       case 'Fog':
       case 'Mist':
       case 'Overcast':
       case 'Cloudy':
         return Colors.blueGrey;

       case 'Patchy rain possible':
       case 'Patchy light rain':
       case 'Light rain':
       case 'Moderate rain at times':
       case 'Moderate rain':
       case 'Heavy rain at times':
       case 'Heavy rain':
       case 'Light rain shower':
       case 'Moderate or heavy rain shower':
       case 'Torrential rain shower':
         return Colors.blue;

       case 'Thundery outbreaks possible':
       case 'Patchy light rain with thunder':
       case 'Moderate or heavy rain with thunder':
       case 'Patchy light snow with thunder':
       case 'Moderate or heavy snow with thunder':
         return Colors.deepPurple;

       default:
         return Colors.cyan;
     }
   }

 }