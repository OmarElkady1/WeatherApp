import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/cubit/10days_weather/bloc_10_days.dart';
import 'package:weather/core/cubit/10days_weather/state_10_days.dart';
import 'package:weather/features/presentation/widgets/drawer_widget.dart';
import 'package:weather/features/presentation/widgets/fifth_widget.dart';
import 'package:weather/features/presentation/widgets/fourth_widget.dart';
import 'package:weather/features/presentation/widgets/second_widget.dart';
import 'package:weather/features/presentation/widgets/skelton.dart';
import 'package:weather/features/presentation/widgets/text_container.dart';
import 'package:weather/features/presentation/widgets/thired_widget.dart';
import 'package:weather/features/presentation/widgets/top_widget.dart';

class HomeWeatherPage extends StatefulWidget {
  const HomeWeatherPage({Key? key}) : super(key: key);

  @override
  State<HomeWeatherPage> createState() => _HomeWeatherPageState();
}

class _HomeWeatherPageState extends State<HomeWeatherPage> {
  late ScrollController scrollController;
  Color background = const Color(0xff81b0dc);
  Color scafoldbackground = const Color(0xff81b0dc);
  double offset = 0;
  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    setState(() {
      scrollController.addListener(() {
        offset = scrollController.position.pixels;
      });
    });

    scrollController.addListener(() {
      debugPrint('${scrollController.position.pixels}');

      if (scrollController.position.pixels <= 80) {
        setState(() {
          scafoldbackground = const Color(0xff81b0dc);
        });
      } else {
        setState(() {
          scafoldbackground = Colors.black;
        });
      }

      if (scrollController.position.pixels >= 80) {
        setState(() {
          background = const Color(0xff171717);
        });
      } else {
        setState(() {
          background = const Color(0xff81b0dc);
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(),
        backgroundColor: scafoldbackground,
        body: BlocBuilder<AppBloc, BlocAppState>(builder: (context, state) {
          if (state is Get5DaysWeatherLoading) {
            return const MySklton();
          } else if (state is Get5DaysWeatherSuccess) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: NestedScrollView(
                  controller: scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innnerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        title: offset >= 80
                            ? Row(
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
                              )
                            : const SizedBox(),
                        bottom: offset >= 80
                            ? AppBar(
                                leading: Container(),
                                backgroundColor: background,
                                actions: [
                                  Image.network(
                                      fit: BoxFit.fill,
                                      'https:${AppBloc.get(context).weatherAfter10Days!.current!.condition!.icon}'),
                                ],
                                title: Row(children: [
                                  Text(
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                      "${(AppBloc.get(context).weatherAfter10Days!.current!.tempC)!.round()}\u00b0"),
                                  Column(children: [
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
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                        Text(
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                            '${(AppBloc.get(context).weatherAfter10Days!.forecast!.forecastday![0].day!.mintempC!)}\u00b0'),
                                      ],
                                    ),
                                    Text(
                                      (AppBloc.get(context)
                                          .weatherAfter10Days!
                                          .location!
                                          .localtime!),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                      ),
                                    ),
                                  ]),
                                ]),
                              )
                            : AppBar(
                                leading: Container(),
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                              ),
                        backgroundColor: background,
                        snap: false,
                        pinned: true,
                        floating: true,
                        expandedHeight: 200,
                        flexibleSpace: FlexibleSpaceBar(
                          background: TopWidget(color: background),
                        ),
                      ),
                    ];
                  },
                  body: Builder(
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SecondWidget(color: background),
                            const SizedBox(
                              height: 10,
                            ),
                            InfoContainer(color: background),
                            const SizedBox(
                              height: 10,
                            ),
                            ThiredWidget(
                              color: background,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FourthWidget(color: background),
                            const SizedBox(
                              height: 10,
                            ),
                            FifthWidget(color: background),
                          ],
                        ),
                      );
                    },
                  )),
            );
          } else {
            return const MySklton();
          }
        }),
      ),
    );
  }
}
