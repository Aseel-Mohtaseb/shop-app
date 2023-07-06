import 'package:dio/dio.dart';
import 'package:shop_app/shared/network/remote/end_points.dart';

class DioHelper {
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

}