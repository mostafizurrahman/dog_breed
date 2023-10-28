import 'package:dog_breed/config/service_locator.dart';
import 'package:dog_breed/data/network/base_api_provider.dart';

import '../data.dart';

class DogImageListApi
    extends AppBaseApi<BaseRequest, ImageListResponse, BaseErrorModel> {
  DogImageListApi({required final String endPoint})
      : super(
          endPoint,
          imageService.get<BaseApiProvider>(),
          imageService.get<BaseErrorModel>(),
        );

  @override
  BaseModel mapResponse(Map<String, dynamic>? responseJson) =>
      BreedListResponse.fromJson(responseJson ?? const {});
}
