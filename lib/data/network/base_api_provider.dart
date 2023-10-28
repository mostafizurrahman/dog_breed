import 'package:dio/dio.dart';

abstract class BaseApiProvider {
  late Dio dio;

  static const int timeOut = 40000;
  static const int receiveOut = 40000;

  static Options getDioOptions({
    final Map<String, String>? headers,
  }) {
    return Options(
      headers: headers ?? {'Content-Type': 'application/json'},
      sendTimeout: const Duration(milliseconds: timeOut),
      receiveTimeout: const Duration(milliseconds: receiveOut),
    );
  }
}
