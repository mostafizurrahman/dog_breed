enum ApiStatus {
  complete,
  progress,
  error,
}

class NetStateModel {
  final ApiStatus status;
  final String message;
  final int code;

  NetStateModel({
    required this.status,
    this.message = 'success',
    this.code = 200,
  });
}
