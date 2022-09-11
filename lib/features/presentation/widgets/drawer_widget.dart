import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/cubit/10days_weather/bloc_10_days.dart';
import 'package:weather/core/cubit/current_weather/my_cubit.dart';
import 'package:weather/features/presentation/home_weather_page.dart';
import 'package:weather/features/presentation/widgets/contact_us_widget.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is GetCurrentWeatherSuccess) {
          void openLocationDialog() {
            showDialog(
                context: context,
                builder: (context) => Form(
                      key: formKey,
                      child: AlertDialog(
                        title: const Text('Add Location'),
                        content: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'title must not be empty';
                            }
                            return null;
                          },
                          controller: controller,
                          decoration: const InputDecoration(
                            hintText: 'Add location',
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  AppCubit.get(context).getCityName();
                                  AppCubit.get(context).getCurrentWeather(
                                      cuntryName: controller.text.toString());
                                  AppBloc.get(context).get10DaysWeather(
                                      cityName: controller.text.toString());

                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeWeatherPage(),
                                  ));
                                  AppCubit.get(context)
                                      .saveCityName(controller.text);
                                }
                              },
                              child: const Text('SUBMIT'))
                        ],
                      ),
                    ));
          }

          void openReportDialog() {
            showDialog(
                context: context,
                builder: (context) => Form(
                      key: formKey,
                      child: AlertDialog(
                        title: const Text('Add Report'),
                        content: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'title must not be empty';
                            }
                            return null;
                          },
                          controller: controller,
                          decoration: const InputDecoration(
                            hintText: 'Write your Report ',
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeWeatherPage(),
                                  ));
                                }
                              },
                              child: const Text('SUBMIT'))
                        ],
                      ),
                    ));
          }

          var cubit = AppCubit.get(context);
          return Drawer(
            backgroundColor: const Color(0xff313944),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Favourite location',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.assignment_late_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            cubit.currentAddress!,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Image.network(
                              fit: BoxFit.fill,
                              'https:${AppCubit.get(context).weatherModel!.forecast!.forecastday![0].hour![0].condition!.icon}'),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${cubit.weatherModel!.current!.tempC}\u00b0',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                          width: double.infinity,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 1.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff4f5761),
                          ),
                          child: MaterialButton(
                              onPressed: () {
                                AppCubit.get(context)
                                    .getLocation()
                                    .then((value) {
                                  AppCubit.get(context)
                                      .getCurrentWeather(cuntryName: value);
                                });
                              },
                              child: const Text(
                                'Get to your Current Weather',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white70,
                                ),
                              ))),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                        '........................................................................',
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.add_location_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Other location',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          AppCubit.get(context).getCurrentWeather(
                            cuntryName:
                                AppCubit.get(context).cityName.toString(),
                          );

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeWeatherPage(),
                          ));
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              cubit.cityName.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            Image.network(
                                fit: BoxFit.fill,
                                'https:${AppCubit.get(context).weatherModel!.forecast!.forecastday![0].hour![0].condition!.icon}'),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${cubit.weatherModel!.current!.tempC}\u00b0',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff4f5761),
                        ),
                        child: MaterialButton(
                            onPressed: () {
                              openLocationDialog();
                            },
                            child: const Text(
                              'Mange location',
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            )),
                      ),
                      Text(
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                        '.................................................................................',
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          openReportDialog();
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.assignment_late_rounded,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Report wrong location',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text('Contact us'),
                                    content: const ContactUSWidget(),
                                    actions: [
                                      TextButton(
                                        child: const Text('close'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ));
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.headset_mic_outlined,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Contact us',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
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
