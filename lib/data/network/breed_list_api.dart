import 'package:dog_breed/config/service_locator.dart';
import 'package:dog_breed/data/network/base_api_provider.dart';

import '../data.dart';

class BreedListApi
    extends AppBaseApi<BaseRequest, BreedListResponse, BaseErrorModel> {
  BreedListApi()
      : super(
          ApiEndPoint.breedList,
          imageService.get<BaseApiProvider>(),
          imageService.get<BaseErrorModel>(),
        );

  @override
  BaseModel mapResponse(Map<String, dynamic>? responseJson) =>
      BreedListResponse.fromJson(responseJson ?? const {});
}
