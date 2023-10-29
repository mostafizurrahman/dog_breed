import '../../config/service_locator.dart';
import '../data.dart';
import 'base_api_provider.dart';

class RandomDogImageApi
    extends AppBaseApi<BaseRequest, RandomImageResponse, BaseErrorModel> {
  RandomDogImageApi({required final String endPoint})
      : super(
          endPoint,
          imageService.get<BaseApiProvider>(),
          imageService.get<BaseErrorModel>(),
        );

  @override
  BaseModel mapResponse(Map<String, dynamic>? responseJson) =>
      RandomImageResponse.fromJson(responseJson ?? const {});
}
