import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/cubit/current_weather/my_cubit.dart';

class TopWidget extends StatelessWidget {
  TopWidget({required this.color, Key? key}) : super(key: key);
  Color color;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final String widgetDate =
            AppCubit.get(context).weatherModel!.location!.localtime!;
        // final parsedDate = DateTime.parse(widgetDate);
        final dateName =
            DateFormat('EE').format(DateFormat("yyyy-MM-DD").parse(widgetDate));

        final timeName = DateFormat('HH:MM a')
            .format(DateFormat("yyyy-MM-DD HH:MM").parse(widgetDate));

        if (state is GetCurrentWeatherSuccess) {
          // final String widgetDate =
          //     AppCubit.get(context).weatherModel!.location!.localtime!;

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
                          "${(AppCubit.get(context).weatherModel!.current!.tempC)!.round()}\u00b0"),
                      const Spacer(),
                      Image.network(
                          fit: BoxFit.fill,
                          'https:${AppCubit.get(context).weatherModel!.current!.condition!.icon}'),
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
                          (AppCubit.get(context).weatherModel!.location!.name)
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
                          '${(AppCubit.get(context).weatherModel!.forecast!.forecastday![0].day!.maxtempC!)}\u00b0'),
                      const Text(
                        ' / ',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      Text(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          '${(AppCubit.get(context).weatherModel!.forecast!.forecastday![0].day!.mintempC!)}\u00b0'),
                      Text(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          'Feels Like ${(AppCubit.get(context).weatherModel!.current!.feelslikeC)}\u00b0'),
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

                      // Text(
                      //     style: const TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 10,
                      //     ),
                      //     '${parsedDate.hour > 12 ? parsedDate.hour - 12 : parsedDate.hour}:${parsedDate.minute <= 9 ? '0${parsedDate.minute}' : parsedDate.minute} ${parsedDate.hour > 12 ? 'PM' : 'AM'}'),
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
