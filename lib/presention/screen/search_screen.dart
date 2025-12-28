

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather/weather_cubit.dart';

class SearchScreen extends StatelessWidget {
 SearchScreen({super.key});
  String cityName ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: TextField(
            onChanged: (data){
              cityName = data;
            },
            onSubmitted:(data){
              cityName = data;
              BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
              Navigator.pop(context);


            } ,
            decoration: InputDecoration(

              contentPadding: EdgeInsets.symmetric(
                horizontal:25 ,
                vertical:33 ,
              ),
             border: OutlineInputBorder(),

             hintText: "Enter City Name ",


            )
          ),
        ),
      ),
    );
  }
}
