import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/cubit/10days_weather/bloc_10_days.dart';
import 'package:weather/core/cubit/10days_weather/state_10_days.dart';

class Weather10Days extends StatelessWidget {
  Weather10Days({Key? key, required this.index}) : super(key: key);
  int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, BlocAppState>(
      builder: (context, state) {
        if (state is Get5DaysWeatherSuccess) {
          var cubit = AppBloc.get(context);

          final String widgetDate = AppBloc.get(context)
              .weatherAfter10Days!
              .forecast!
              .forecastday![index]
              .date!;
          final dateName = DateFormat('EEEE')
              .format(DateFormat("yyyy-MM-DD").parse(widgetDate));

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: 101,
                child: Text(
                  dateName,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              // Text(
              //   '${cubit.weatherAfter10Days!.forecast!.forecastday![index].date}',
              //   style: const TextStyle(color: Colors.white, fontSize: 20),
              // ),
              const SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/humidity.png',
                    width: 10,
                    height: 10,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${cubit.weatherAfter10Days!.forecast!.forecastday![index].hour![index].humidity}%',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                'assets/images/sun.png',
                width: 15,
                height: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                'assets/images/crescent-moon.png',
                width: 15,
                height: 15,
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Text(
                    '${cubit.weatherAfter10Days!.forecast!.forecastday![index].day!.maxtempC}\u00b0',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${cubit.weatherAfter10Days!.forecast!.forecastday![index].day!.mintempC}\u00b0',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ]),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
