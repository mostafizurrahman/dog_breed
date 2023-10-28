// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      message: fromJsonT(json['message']),
      status: json['status'] as String,
    );

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'message': toJsonT(instance.message),
    };

RandomImageResponse _$RandomImageResponseFromJson(Map<String, dynamic> json) =>
    RandomImageResponse(
      message: json['message'] as String,
      status: json['status'] as String,
    );

ImageListResponse _$ImageListResponseFromJson(Map<String, dynamic> json) =>
    ImageListResponse(
      message:
          (json['message'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String,
    );

BaseErrorResponse _$BaseErrorResponseFromJson(Map<String, dynamic> json) =>
    BaseErrorResponse(
      message: json['message'] as String?,
      code: json['code'] as String?,
    );

BreedListResponse _$BreedListResponseFromJson(Map<String, dynamic> json) =>
    BreedListResponse(
      message:
          (json['message'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String,
    );
