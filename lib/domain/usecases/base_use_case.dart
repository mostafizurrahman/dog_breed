import 'package:dog_breed/config/service_locator.dart';
import '../domain.dart';

abstract class BaseUseCase<TOutput, TInput> {
  final repository = imageService.get<DogBreedImageRepository>();
  BaseUseCase();
  Future<TOutput> call(TInput input);
}
