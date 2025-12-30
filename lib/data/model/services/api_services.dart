import 'package:dio/dio.dart';
import 'package:weather/data/model/weather_model.dart';

class ApiServices {
  final Dio dio;
  final String apiKey = " cbbbcfa096944bd49b544144252512";
  final String baseUrl = "https://api.weatherapi.com/v1";

  ApiServices(this.dio);

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    try {
      final response = await dio.get(
        "$baseUrl/forecast.json",
        queryParameters: {'key': apiKey, 'q': cityName, 'day': 1},
      );
      if(response.statusCode==200){
      WeatherModel weatherModel=WeatherModel.fromJson(response.data);
      return weatherModel;
      }else{
        throw Exception(response.data["error"]["message"]);
      }
    } on DioException catch (e) {
     if(e.response?.statusCode ==400){
       throw Exception(e.response?.data["error"]["message"]);
     }else{
       throw Exception("Failed to Connected Services");
     }
    }
  }
}
