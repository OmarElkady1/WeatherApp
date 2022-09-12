import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/cubit/10days_weather/bloc_10_days.dart';
import 'package:weather/core/cubit/10days_weather/state_10_days.dart';

class TopWidget extends StatelessWidget {
  TopWidget({required this.color, Key? key}) : super(key: key);
  Color color;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, BlocAppState>(
      builder: (context, state) {
        if (state is Get5DaysWeatherSuccess) {
          final String widgetDate =
              AppBloc.get(context).weatherAfter10Days!.location!.localtime!;
          // final parsedDate = DateTime.parse(widgetDate);
          final dateName = DateFormat('EE')
              .format(DateFormat("yyyy-MM-DD").parse(widgetDate));

          final timeName = DateFormat('HH:MM a')
              .format(DateFormat("yyyy-MM-DD HH:MM").parse(widgetDate));
          return Container(
            color: color,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                          "${(AppBloc.get(context).weatherAfter10Days!.current!.tempC)!.round()}\u00b0"),
                      const Spacer(),
                      Image.network(
                          fit: BoxFit.fill,
                          'https:${AppBloc.get(context).weatherAfter10Days!.current!.condition!.icon}'),
                    ],
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Row(
                    children: [
                      Text(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          (AppBloc.get(context)
                                  .weatherAfter10Days!
                                  .location!
                                  .name)
                              .toString()),
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          '${(AppBloc.get(context).weatherAfter10Days!.forecast!.forecastday![0].day!.maxtempC!)}\u00b0'),
                      const Text(
                        ' / ',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      Text(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          '${(AppBloc.get(context).weatherAfter10Days!.forecast!.forecastday![0].day!.mintempC!)}\u00b0'),
                      Text(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          'Feels Like ${(AppBloc.get(context).weatherAfter10Days!.current!.feelslikeC)}\u00b0'),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          ('$dateName,')),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          timeName)
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
