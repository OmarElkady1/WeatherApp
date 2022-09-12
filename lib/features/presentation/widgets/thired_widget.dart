import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather/core/cubit/10days_weather/bloc_10_days.dart';
import 'package:weather/core/cubit/10days_weather/state_10_days.dart';
import 'package:weather/core/widgets/weather_10Days.dart';

class ThiredWidget extends StatelessWidget {
  ThiredWidget({Key? key, required this.color}) : super(key: key);
  Color color;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, BlocAppState>(
      builder: (context, state) {
        if (state is Get5DaysWeatherSuccess) {
          var cubit = AppBloc.get(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Container(
                width: double.infinity,
                height: 200,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                    blurRadius: 1.0,
                  ),
                ], borderRadius: BorderRadius.circular(10), color: color),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        Weather10Days(index: index),
                    itemCount:
                        cubit.weatherAfter10Days!.forecast!.forecastday!.length,
                    scrollDirection: Axis.vertical,
                  ),
                )),
          );
        } else {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  //color: Colors.grey,
                  // offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 1.0,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff81b0dc),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 15,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 10,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 10,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 15,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 10,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
