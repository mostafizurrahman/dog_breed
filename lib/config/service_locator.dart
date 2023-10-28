import 'dart:async';
import 'package:dog_breed/domain/domain.dart';
import 'package:get_it/get_it.dart';
import '../data/data.dart';
import '../data/network/base_api_provider.dart';
import 'app_config.dart';

final imageService = GetIt.asNewInstance();
Future<void> initImageService({
  required final StreamController<NetStateModel> notifier,
  Map<String, dynamic> headers = const {},
}) async {
  await imageService.reset(dispose: true);

  imageService.registerFactory<BaseApiProvider>(
    () => BreedApiProvider(
      baseUrl: AppConfig.baseUrl,
      apiNotifier: notifier,
      headers: headers,
    ),
  );

  imageService.registerFactory<ImageRemoteDataSource>(
    () => ImageRemoteDataSourceImpl(),
  );
  imageService.registerFactory<DogBreedImageRepository>(
    () => DogImageRepositoryImpl(),
  );

  imageService.registerFactory<ErrorResponse>(() => ErrorResponse());
  imageService.registerFactory<BaseErrorModel>(() => ErrorResponse());
}
