import '../domain.dart';

abstract class DogBreedImageRepository {

  Future<BreedList?> getDogBreedList();

  Future<DogList?> getDogList({
    required final BreedEntity breed,
  });

  Future<DogImage?> getRandomDogImage({
    required final BreedEntity breed,
  });
}
