import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather/core/cubit/current_weather/my_cubit.dart';
import 'package:weather/core/widgets/all_day_temp.dart';

class SecondWidget extends StatelessWidget {
  SecondWidget({Key? key, required this.color}) : super(key: key);
  Color color;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetCurrentWeatherSuccess) {
          var cubit = AppCubit.get(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  //color: Colors.grey,
                  // offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 1.0,
                ),
              ], borderRadius: BorderRadius.circular(10), color: color),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemBuilder: (context, index) => AllDayTemp(
                      weatherModel: cubit.weatherModel!, index: index),
                  itemCount: cubit
                      .weatherModel!.forecast!.forecastday![0].hour!.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          );
        } else {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: const Color(0xff81b0dc),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 1.0,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 25,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      highlightColor: Colors.black.withOpacity(1),
                      baseColor: Colors.black.withOpacity(.2),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.black.withOpacity(.1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Shimmer.fromColors(
                      highlightColor: Colors.black.withOpacity(1),
                      baseColor: Colors.black.withOpacity(.2),
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(.1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Shimmer.fromColors(
                      highlightColor: Colors.black.withOpacity(1),
                      baseColor: Colors.black.withOpacity(.2),
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.black.withOpacity(.1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Shimmer.fromColors(
                      highlightColor: Colors.black.withOpacity(1),
                      baseColor: Colors.black.withOpacity(.2),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.black.withOpacity(.1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
