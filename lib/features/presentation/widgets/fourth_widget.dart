import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/cubit/10days_weather/bloc_10_days.dart';
import 'package:weather/core/cubit/10days_weather/state_10_days.dart';
import 'package:weather/core/cubit/current_weather/my_cubit.dart';

class FourthWidget extends StatelessWidget {
  FourthWidget({required this.color, Key? key}) : super(key: key);
  Color color;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, BlocAppState>(
      builder: (context, state) {
        if (state is Get5DaysWeatherSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              width: double.infinity,
              height: 180,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  //color: Colors.grey,
                  // offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 1.0,
                ),
              ], borderRadius: BorderRadius.circular(10), color: color),
              child: Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          "Sunrise",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${AppBloc.get(context).weatherAfter10Days!.forecast!.forecastday![0].astro!.sunset} ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.width / 6,
                            color: Colors.transparent,
                            child: const Image(
                              image: AssetImage('assets/images/sunrise.png'),
                            )),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          "Sunset",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${AppBloc.get(context).weatherAfter10Days!.forecast!.forecastday![0].astro!.sunset} ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.width / 6,
                            color: Colors.transparent,
                            child: const Image(
                              image:
                                  AssetImage('assets/images/beach-sunset.png'),
                            )),
                      ],
                    ),
                  ),
                  const Spacer(),
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
