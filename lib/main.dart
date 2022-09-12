import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/cubit/10days_weather/bloc_10_days.dart';
import 'package:weather/core/network/my_dio.dart';
import 'package:weather/features/presentation/home_weather_page.dart';
import 'package:weather/features/presentation/widgets/fourth_widget.dart';
import 'package:weather/features/presentation/widgets/second_widget.dart';
import 'package:weather/features/presentation/widgets/thired_widget.dart';
import 'package:weather/features/presentation/widgets/top_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppBloc()
              ..getCityName()
              ..get10DaysWeather(cityName: 'zagazig 1')),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeWeatherPage(),
      ),
    );
  }
}
