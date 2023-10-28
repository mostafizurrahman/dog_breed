part of 'models.dart';

@JsonSerializable(createToJson: false)
class BreedListResponse extends BaseResponse<Map<String, List<String>>> {
  BreedListResponse({required super.message, required super.status});

  factory BreedListResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedListResponseFromJson(json);

  BreedList toEntity() => BreedList(
    dogs: super.message,
    status: super.status,
  );
}