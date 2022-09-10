import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/cubit/current_weather/my_cubit.dart';
import 'package:weather/core/models/weather_model.dart';

class AllDayTemp extends StatelessWidget {
  AllDayTemp({required this.weatherModel, required this.index, Key? key})
      : super(key: key);
  WeatherModelApi weatherModel;
  int index;
  @override
  Widget build(BuildContext context) {
    final String widgetDate =
        "${weatherModel.forecast!.forecastday![0].hour![index].time}";
    final parsedDate = DateTime.parse(widgetDate);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is GetCurrentWeatherSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Column(
              children: [
                Text(
                    '${parsedDate.hour > 12 ? parsedDate.hour - 12 : parsedDate.hour == 0 ? '12' : parsedDate.hour} ${parsedDate.hour > 12 ? 'PM' : 'AM'}',
                    style: const TextStyle(fontSize: 10, color: Colors.white)),
                const SizedBox(
                  height: 0,
                ),
                Image.network(
                    fit: BoxFit.fill,
                    'https:${weatherModel.forecast!.forecastday![0].hour![index].condition!.icon}'),
                const SizedBox(
                  height: 0,
                ),
                Text(
                  '${weatherModel.forecast!.forecastday![0].hour![index].tempC!}\u00b0',
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(
                  height: 45,
                ),
                Text(
                  '${weatherModel.forecast!.forecastday![0].hour![index].humidity!}%',
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
