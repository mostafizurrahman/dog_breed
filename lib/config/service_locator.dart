import 'package:get_it/get_it.dart';

final imageService = GetIt.asNewInstance();
Future<void> initImageService() async {
  await imageService.reset(dispose: true);
}
