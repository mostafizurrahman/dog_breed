

part of "models.dart";
@JsonSerializable(genericArgumentFactories: true)
@JsonSerializable(createToJson: false)
class BaseResponse<T> extends BaseModel<BaseResponse> {
  final String status;
  final T message;

  BaseResponse({required this.message, required this.status,});

  @override
  Map<String, dynamic> toJson() => {};

}