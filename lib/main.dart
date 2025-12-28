import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/model/services/api_services.dart';
import 'cubit/counter/counter_cubit.dart';

import 'cubit/weather/weather_cubit.dart';
import 'presention/screen/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>WeatherCubit(ApiServices(Dio())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomeScreen(),
      ),
    );
  }
}

