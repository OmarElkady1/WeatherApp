import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/cubit/10days_weather/state_10_days.dart';
import 'package:weather/core/models/weather_10days_model.dart';
import 'package:weather/core/network/end_point.dart';
import 'package:weather/core/network/my_dio.dart';

class AppBloc extends Cubit<BlocAppState> {
  AppBloc() : super(MyCubitInitial5Days());
  static AppBloc get(context) => BlocProvider.of(context);

  String? cityName;
  getCityName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cityName = prefs.getString('cityName');
    debugPrint("$cityName+citygetssssssssssssssssssss");
    emit(GetSharePrefDataSuccess());
  }

  saveCityName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('cityName', name);
    //prefs.setStringList('cityName', name);
    debugPrint("$name+cityasvveeeeed");

    emit(SaveSharePrefDataSuccess());
  }

  String currentAddress = "cairo";

  Future<String> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];
    //String currentAddress;
    currentAddress = "${place.subAdministrativeArea}";
    debugPrint('***********11+$currentAddress');

    emit(GetLocationSuccess());

    debugPrint('***********+$currentAddress');
    return currentAddress;
  }

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
