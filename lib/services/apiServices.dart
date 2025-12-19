import 'dart:math';

import 'package:api_december_2025/models/User.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ApiServices {
  // baseurl
  final baseUrl = "https://freeapi.luminartechnohub.com";

  //Dio
  Dio dio = Dio();

  //logger
  final logger = Logger();

  ApiServices() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logger.i("URL ::: ${options.uri.data}");
          logger.i("Methode ::: ${options.method}");
          logger.i("Headers :: ${options.headers}");
          logger.i("Data ::: ${options.data}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          logger.i("Status Code ::: ${response.statusCode}");
          logger.i("Response ::: ${response.data}");
          return handler.next(response);
        },
        onError: (error, handler) {
          logger.i("Error Message ::: ${error.message}");
          return handler.next(error);
        },
      ),
    );
  }

  Future<User?> login({required String email, required String password}) async {
    final url = "$baseUrl/login";

    //Headers
    // -H 'accept: application/json' \
    // -H 'Content-Type: application/json' \
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    //Data
    //   -d '{
    //   "email": "siya@gmail.com",
    //   "password": "123456"
    // }'
    final data = {"email": email, "password": password};

    try {
      final response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: headers,
          receiveTimeout: Duration(seconds: 11),
          sendTimeout: Duration(seconds: 11),
        ),
      );
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
