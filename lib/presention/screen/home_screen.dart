import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather/weather_cubit.dart';
import 'package:weather/presention/screen/search_screen.dart';
import 'package:weather/presention/screen/widget/no_data_body.dart';

import 'widget/weather_details_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit,WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator(),);
          }
          else if (state is WeatherSuccess) {
            return WeatherDetailsBody(weathermodel: state.weathermodel,);
          }
          else if (state is WeatherError) {
            return Center(child: Text(state.message),);
          }
          else {
            return NoDataBody();
          }
        }
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
          }, child: Icon(Icons.search)),
    );
  }
}


