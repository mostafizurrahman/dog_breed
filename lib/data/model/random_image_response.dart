part of "models.dart";

@JsonSerializable(createToJson: false)
class RandomImageResponse extends BaseResponse<String> {
  RandomImageResponse({required super.message, required super.status});

  factory RandomImageResponse.fromJson(Map<String, dynamic> json) =>
      _$RandomImageResponseFromJson(json);
}
