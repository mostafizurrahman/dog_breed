part of 'models.dart';

@JsonSerializable(createToJson: false)
class ImageListResponse extends BaseResponse<List<String>> {
  ImageListResponse({required super.message, required super.status});

  factory ImageListResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageListResponseFromJson(json);
}
