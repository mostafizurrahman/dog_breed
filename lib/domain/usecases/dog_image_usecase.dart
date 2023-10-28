import '../domain.dart';

class DogListUsecase extends BaseUseCase<DogImage?, BreedEntity> {
  DogListUsecase();

  @override
  Future<DogImage?> call(final BreedEntity input) async {
    final dog = await repository.getRandomDogImage(breed: input);
    return dog;
  }
}
