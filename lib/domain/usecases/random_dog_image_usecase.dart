import '../domain.dart';

class RandomDogImageUsecase extends BaseUseCase<DogImage?, BreedEntity> {
  RandomDogImageUsecase();

  @override
  Future<DogImage?> call(final BreedEntity input) async {
    final dog = await repository.getRandomDogImage(breed: input);
    return dog;
  }
}
