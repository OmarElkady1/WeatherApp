import 'package:dio/dio.dart';
import 'package:weather/core/network/end_point.dart';

class DioHelper {
  static final DioHelper _instance = DioHelper._internal();

  factory DioHelper() {
    return _instance;
  }

  static late Dio dio;

  DioHelper._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: '$baseUrl$version',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getDate({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
