

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/weather/weather_cubit.dart';
import '../../../data/model/weather_model.dart';

class WeatherDetailsBody extends StatelessWidget {
  final WeatherModel weathermodel;
  const WeatherDetailsBody({super.key,required this.weathermodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          weathermodel.getThemeColor(),
          weathermodel.getThemeColor()[300]!,
          weathermodel.getThemeColor()[100]!,
        ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(BlocProvider.of<WeatherCubit>(context).cityName!,

          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        Text("UpdateAt: ${weathermodel.time.hour.toString()} :  ${weathermodel.time.minute.toString()} ",
          style: TextStyle(fontSize: 20),),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/snow.png"),
            Text(
               "${weathermodel.avgTemp.toString()} C",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Column(
              children: [
                Text("minTemp:${weathermodel.minTemp.toString()}"),
                Text("maxTemp:${weathermodel.maxTemp.toString()}")
              ],
            )
          ],
        ),
          SizedBox(height: 10,),
          Text(weathermodel.weatherStateName,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
      ],
      ),
    );
  }
}
