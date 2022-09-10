import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
//import 'package:location/location.dart' as currentLocation;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/models/weather_model.dart';
import 'package:weather/core/network/end_point.dart';
import 'package:weather/core/network/my_dio.dart';

part 'my_cubit_state.dart';

class AppCubit extends Cubit<AppState> {
  // final currentLocation.Location location = currentLocation.Location();
  AppCubit() : super(MyCubitInitial());
  static AppCubit get(context) => BlocProvider.of(context);
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

  String currentAddress = '';

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

  WeatherModelApi? weatherModel;

  getCurrentWeather({required String? cuntryName}) async {
    emit(GetCurrentWeatherLoading());

    Response currentWeatherResponse =
        await DioHelper.getDate(url: forecast, query: {
      'key': '3abc4ac71f114deb86380405201809',
      'q': cuntryName,
      'days': 1,
      'aqi': 'no',
      'alerts': 'no',
    });

    emit(GetCurrentWeatherSuccess());

    debugPrint('1---------------------1');
    weatherModel = WeatherModelApi.fromJson(
      currentWeatherResponse.data,
    );
    debugPrint(currentWeatherResponse.data.toString());

    debugPrint(weatherModel!.location!.name);
    debugPrint(weatherModel!.current!.tempC.toString());
  }

  // bool serviceEnabled = false;
  // currentLocation.PermissionStatus? permissionGranted;
  // currentLocation.LocationData? locationData;

  // double? _lat;
  // double? _long;

  // double get currentLat => _lat ?? 0.0;

  // double get currentLong => _long ?? 0.0;
  // getLocation() async {
  //   if (permissionGranted == null || locationData == null) {
  //     serviceEnabled = await location.serviceEnabled();
  //     if (!serviceEnabled) {
  //       serviceEnabled = await location.requestService();
  //       if (!serviceEnabled) {
  //         return;
  //       }
  //     }

  //     permissionGranted = await location.hasPermission();
  //     if (permissionGranted == currentLocation.PermissionStatus.denied) {
  //       permissionGranted = await location.requestPermission();
  //       if (permissionGranted != currentLocation.PermissionStatus.granted) {
  //         return;
  //       }
  //     }
  //     location.getLocation().then((currentLocation) {
  //       _lat = currentLocation.latitude;
  //       _long = currentLocation.longitude;
  //       emit(GetLocationSuccess());
  //     });
  //   }
  // }

  // bool serviceEnabled = false;
  // currentLocation.PermissionStatus? permissionGranted;
  // currentLocation.LocationData? locationData;

  // double? _lat;
  // double? _long;

  // double get currentLat => _lat ?? 0.0;

  // double get currentLong => _long ?? 0.0;
  // getLocation() async {
  //   if (permissionGranted == null || locationData == null) {
  //     serviceEnabled = await location.serviceEnabled();
  //     if (!serviceEnabled) {
  //       serviceEnabled = await location.requestService();
  //       if (!serviceEnabled) {
  //         return;
  //       }
  //     }

  //     permissionGranted = await location.hasPermission();
  //     if (permissionGranted == currentLocation.PermissionStatus.denied) {
  //       permissionGranted = await location.requestPermission();
  //       if (permissionGranted != currentLocation.PermissionStatus.granted) {
  //         return;
  //       }
  //     }
  //     location.getLocation().then((currentLocation) {
  //       _lat = currentLocation.latitude;
  //       _long = currentLocation.longitude;
  //       emit(GetLocationSuccess());
  //     });
  //   }
  // }

  // String country = "";
  // String city = "";
  // String area = "";

  // Future<void> getLocationByLatLong(double lat, double long) async {
  //   try {
  //     if (lat != 0.0 && long != 0.0) {
  //       List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
  //       // log("placeMarker : ${placemarks[0].country},${placemarks[0].administrativeArea},${placemarks[0].locality} ");
  //       country = placemarks[0].country ?? "";
  //       city = placemarks[0].administrativeArea ?? "";
  //       area = placemarks[0].locality ?? "";

  //       emit(GetLocationSuccess());
  //     } else {
  //       log("Please check your current location");
  //     }
  //   } catch (e) {
  //     log("$e Please check your current location");
  //   }
  // }
}
