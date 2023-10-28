enum ApiStatus {
  complete,
  progress,
  error,
}

class NetworkEntity {
  final ApiStatus status;
  final String message;
  final int code;

  NetworkEntity({
    required this.status,
    this.message = 'success',
    this.code = 200,
  });
}
