import 'package:dio/dio.dart';

abstract class BaseErrorModel {
  DioException? dioException;

  BaseErrorModel generate(dynamic error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout) {
        dioException = error;
      } else if (error.response?.data is Map<String, dynamic>) {
        generateError(error.response?.data as Map<String, dynamic>?);
      }
    }

    return this;
  }

  void setDioError(DioException error) => dioException = error;

  void generateError(Map<String, dynamic>? data);
}

