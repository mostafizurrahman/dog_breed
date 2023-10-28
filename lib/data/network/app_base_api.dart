import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dog_breed/data/model/base_error_model.dart';

import '../model/base_model.dart';
import 'base_api_provider.dart';

abstract class AppBaseApi<TRequest extends BaseModel,
    TResponse extends BaseModel, TError extends BaseErrorModel> {
  final String endPoint;
  final BaseApiProvider apiProvider;
  final BaseErrorModel baseError;
  String get url => '${apiProvider.dio.options.baseUrl}$endPoint';
  AppBaseApi(
    this.endPoint,
    this.apiProvider,
    this.baseError,
  );

  Future<Response<Map<String, dynamic>>> postRaw(
    TRequest input, {
    Map<String, String>? headers,
  }) async {
    String requestBody = input.toString();
    final dioOptions = BaseApiProvider.getDioOptions(headers: headers);
    Response<Map<String, dynamic>> response = await apiProvider.dio.post(
      url,
      data: requestBody,
      options: dioOptions,
    );

    return response;
  }

  Future<Either<TResponse, TError>> post(
    TRequest input, {
    Map<String, String>? headers,
  }) async {
    try {
      Response<Map<String, dynamic>> response = await postRaw(
        input,
        headers: headers,
      );
      return Left(mapResponse(response.data) as TResponse);
    } on DioException catch (error) {
      return Right(baseError.generate(error) as TError);
    } catch (err) {
      return Right(baseError.generate(err) as TError);
    }
  }

  Future<Response<Map<String, dynamic>>> getRaw({
    Map<String, String>? headers,
  }) async {
    final dioOptions = BaseApiProvider.getDioOptions(headers: headers);
    Response<Map<String, dynamic>> response = await this.apiProvider.dio.get(
          url,
          options: dioOptions,
        );
    return response;
  }

  Future<Either<TResponse, TError>> get({Map<String, String>? headers}) async {
    try {
      Response<Map<String, dynamic>> response = await getRaw(headers: headers);

      return Left(mapResponse(response.data) as TResponse);
    } on DioException catch (error) {
      return Right(baseError.generate(error) as TError);
    } catch (err) {
      return Right(baseError.generate(err) as TError);
    }
  }

  BaseModel mapResponse(Map<String, dynamic>? responseJson);
}
