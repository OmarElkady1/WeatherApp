import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/cubit/10days_weather/state_10_days.dart';
import 'package:weather/core/models/weather_10days_model.dart';
import 'package:weather/core/network/end_point.dart';
import 'package:weather/core/network/my_dio.dart';

class AppBloc extends Cubit<BlocAppState> {
  AppBloc() : super(MyCubitInitial5Days());
  static AppBloc get(context) => BlocProvider.of(context);
  WeatherAfter10Days? weatherAfter10Days;

  Future get10DaysWeather({required String? cityName}) async {
    emit(Get5DaysWeatherLoading());
    Response currentWeatherResponse =
        await DioHelper.getDate(url: forecast, query: {
      'key': '50b5952b5a6f4278917231052220609',
      'q': cityName,
      'days': 10,
      'aqi': 'no',
      'alerts': 'no',
    });

    emit(Get5DaysWeatherSuccess());

    debugPrint('2---------------------2');
    weatherAfter10Days = WeatherAfter10Days.fromJson(
      currentWeatherResponse.data,
    );
    debugPrint(currentWeatherResponse.data.toString());

    debugPrint(weatherAfter10Days!.forecast!.forecastday![0].date);
    debugPrint(weatherAfter10Days!.forecast!.forecastday![1].date);
    debugPrint(weatherAfter10Days!.forecast!.forecastday![2].date);
    debugPrint(weatherAfter10Days!.forecast!.forecastday![3].date);
    debugPrint(weatherAfter10Days!.forecast!.forecastday![4].date);
    debugPrint(weatherAfter10Days!.forecast!.forecastday![5].date);
    debugPrint(weatherAfter10Days!.current!.tempC.toString());
  }
}
