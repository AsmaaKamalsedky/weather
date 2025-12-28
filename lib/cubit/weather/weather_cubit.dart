import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:weather/data/model/services/api_services.dart';
import 'package:weather/data/model/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit( this.apiServices, ) : super(WeatherInitial());
  final ApiServices apiServices;
   WeatherModel  ?weathermodel;
   String ?cityName ;

  getWeather({required String cityName})async{
    try {
      emit(WeatherLoading());
      weathermodel =await apiServices.getWeatherData(cityName: cityName);
      emit(WeatherSuccess(weathermodel: weathermodel!));
    }   catch (e) {
      emit(WeatherError(message: e.toString()));

    }
  }
}
