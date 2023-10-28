part of "models.dart";

class ErrorResponse extends BaseErrorModel {
  static const String _defaultCode = '400';
  static const String _defaultMsg = 'Data not found or connection closed!';
  BaseErrorResponse? errorResponse;

  @override
  void generateError(dynamic data) {
    try {
      errorResponse = BaseErrorResponse.fromJson(data);
    } catch (_) {
      errorResponse = _getDefaultError();
    }
  }

  ErrorEntity toEntity() =>
      errorResponse?.toEntity() ?? _getDefaultError().toEntity();

  BaseErrorResponse _getDefaultError() {
    return const BaseErrorResponse(
      code: ErrorResponse._defaultCode,
      message: ErrorResponse._defaultMsg,
    );
  }
}

@JsonSerializable(createToJson: false)
class BaseErrorResponse extends BaseModel<BaseErrorResponse> {
  final String? message;
  final String? code;

  const BaseErrorResponse({
    this.message,
    this.code,
  });

  factory BaseErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseErrorResponseFromJson(json);

  ErrorEntity toEntity() => ErrorEntity(
        errorCode: code ?? ErrorResponse._defaultCode,
        errorMsg: message ?? ErrorResponse._defaultMsg,
      );

  @override
  Map<String, dynamic> toJson() => const {};
}
