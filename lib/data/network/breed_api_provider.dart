import 'dart:async';
import 'package:dio/dio.dart';
import '../../domain/domain.dart';
import 'base_api_provider.dart';

class BreedApiProvider extends BaseApiProvider {
  final String baseUrl;

  final StreamController<NetworkEntity> apiNotifier;

  final List<String> _customLoadingApis = [];
  final List<String> _customClosingApis = [];

  BreedApiProvider({
    required this.baseUrl,
    required this.apiNotifier,
    final bool shouldLog = false,
    final Map<String, dynamic> headers = const {},
  }) {
    BaseOptions options = _getBaseOption(baseUrl: baseUrl);
    dio = Dio(options);
    _setLogInterceptor(shouldLog: shouldLog);
    _setLoadingInterceptor();
    _setInterceptorFor(commonHeaders: headers);
  }

  void _setLoadingInterceptor() {
    final loaderInterceptor = InterceptorsWrapper(
      onRequest: _onLoadingRequested,
      onResponse: _onHandleResponse,
      onError: _onErrorNotifier,
    );
    dio.interceptors.add(loaderInterceptor);
  }

  void _onErrorNotifier(DioException error, handler) async {
    if (error.response?.data != null) {
      final errorNotification = NetworkEntity(
        status: ApiStatus.error,
        message: error.response?.data.toString() ?? 'Error occurred',
        code: error.response?.statusCode ?? 400,
      );
      _sinkNotifierWith(notification: errorNotification);
    } else {
      //TODO : Check network connectivity here
      //Leaving it for a generic message

      final netState = NetworkEntity(
        status: ApiStatus.error,
        message: error.message ?? 'Something went wrong!',
        code: error.response?.statusCode ?? 400,
      );
      _sinkNotifierWith(notification: netState);
    }
    handler.next(error);
  }

  void _onHandleResponse(Response response, handler) {
    if (!_customClosingApis.contains(response.requestOptions.path)) {
      final complete = NetworkEntity(
        status: ApiStatus.complete,
        message: response.statusMessage ?? 'API calling completed',
        code: response.statusCode ?? 200,
      );
      _sinkNotifierWith(notification: complete);
    }
    handler.next(response); //continue
  }

  void _onLoadingRequested(
    final RequestOptions options,
    final handler,
  ) {
    if (!_customLoadingApis.contains(options.path)) {
      final msg = '${options.method.toUpperCase()} API calling started with'
          ' end-point //${options.path}';
      final starter = NetworkEntity(
        status: ApiStatus.complete,
        message: msg,
        code: -1,
      );
      _sinkNotifierWith(notification: starter);
    }
    handler.next(options);
  }

  void _setInterceptorFor({
    required final Map<String, dynamic> commonHeaders,
  }) {
    final interceptor = InterceptorsWrapper(
      onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) async {
        options.headers.addAll(commonHeaders);
        handler.next(options);
      },
    );
    dio.interceptors.add(interceptor);
  }

  void _sinkNotifierWith({required final NetworkEntity notification}) {
    apiNotifier.sink.add(notification);
  }

  void _setLogInterceptor({required bool shouldLog}) {
    if (shouldLog) {
      final logInterceptor = LogInterceptor(
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      );
      dio.interceptors.add(logInterceptor);
    }
  }

  BaseOptions _getBaseOption({required final String baseUrl}) {
    final Map<String, String> baseHeaders = {
      'accept': 'application/json',
      'content-type': 'application/json',
    };
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: baseHeaders,
    );

    return options;
  }
}
