import 'dart:convert';

abstract class BaseModel<T> {
  const BaseModel();
  Map<String, dynamic> toJson();

  @override
  String toString() => json.encode(toJson());
}

class BaseRequest extends BaseModel<BaseRequest> {
  final String breed;
  final String subBreed;
  BaseRequest({
    this.breed = '',
    this.subBreed = '',
  });

  @override
  Map<String, dynamic> toJson() => {
        'breed': breed,
        'subBreed': subBreed,
      };
}
