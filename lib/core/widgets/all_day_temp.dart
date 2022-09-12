import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/cubit/10days_weather/bloc_10_days.dart';
import 'package:weather/core/cubit/10days_weather/state_10_days.dart';
import 'package:weather/core/models/weather_10days_model.dart';
import 'package:weather/core/widgets/weather_10Days.dart';

class AllDayTemp extends StatelessWidget {
  AllDayTemp({required this.weatherAfter10Days, required this.index, Key? key})
      : super(key: key);
  WeatherAfter10Days weatherAfter10Days;
  int index;
  @override
  Widget build(BuildContext context) {
    final String widgetDate =
        "${weatherAfter10Days.forecast!.forecastday![0].hour![index].time}";
    final parsedDate = DateTime.parse(widgetDate);
    return BlocBuilder<AppBloc, BlocAppState>(
      builder: (context, state) {
        if (state is Get5DaysWeatherSuccess) {
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
                    'https:${weatherAfter10Days.forecast!.forecastday![0].hour![index].condition!.icon}'),
                const SizedBox(
                  height: 0,
                ),
                Text(
                  '${weatherAfter10Days.forecast!.forecastday![0].hour![index].tempC!}\u00b0',
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(
                  height: 45,
                ),
                Text(
                  '${weatherAfter10Days.forecast!.forecastday![0].hour![index].humidity!}%',
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
