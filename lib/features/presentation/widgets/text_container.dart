import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/cubit/current_weather/my_cubit.dart';

class InfoContainer extends StatelessWidget {
  InfoContainer({Key? key, required this.color}) : super(key: key);
  Color color;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetCurrentWeatherSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                    blurRadius: 1.0,
                  ),
                ], borderRadius: BorderRadius.circular(10), color: color),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Today\'s Temperature ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Expect the same as reasterday  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: Colors.white54),
                      ),
                    ],
                  ),
                )),
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
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.black.withOpacity(.1),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(.1),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.black.withOpacity(.1),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.black.withOpacity(.1),
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
