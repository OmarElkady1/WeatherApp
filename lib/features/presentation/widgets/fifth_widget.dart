import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/cubit/current_weather/my_cubit.dart';

class FifthWidget extends StatelessWidget {
  FifthWidget({required this.color, Key? key}) : super(key: key);
  Color color;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is GetCurrentWeatherSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              width: double.infinity,
              height: 180,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
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
                        Container(
                            height: MediaQuery.of(context).size.width / 8,
                            color: Colors.transparent,
                            child: const Image(
                              image: AssetImage('assets/images/moon.png'),
                            )),
                        const SizedBox(
                          height: 3,
                        ),
                        const Text(
                          "UV index",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          " High",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      width: 1,
                      height: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.width / 8,
                            color: Colors.transparent,
                            child: const Image(
                              image: AssetImage('assets/images/wind.png'),
                            )),
                        const SizedBox(
                          height: 3,
                        ),
                        const Text(
                          "Wind",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${AppCubit.get(context).weatherModel!.current!.windMph * 1.609344.round()}km/h ",
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      width: 1,
                      height: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.width / 8,
                            color: Colors.transparent,
                            child: const Image(
                              image:
                                  AssetImage('assets/images/humidity _h1.png'),
                            )),
                        const SizedBox(
                          height: 3,
                        ),
                        const Text(
                          "Humidity",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${AppCubit.get(context).weatherModel!.current!.humidity} %",
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
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
