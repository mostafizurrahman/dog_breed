import '../domain.dart';

class DogImageListUsecase extends BaseUseCase<DogList?, BreedEntity> {
  DogImageListUsecase();

  @override
  Future<DogList?> call(final BreedEntity input) async {
    final dogs = await repository.getDogList(breed: input);
    return dogs;
  }
}
