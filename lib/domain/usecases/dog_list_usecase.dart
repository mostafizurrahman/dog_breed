


import '../domain.dart';

class DogListUsecase extends BaseUseCase<DogList?, BreedEntity> {
  DogListUsecase();

  @override
  Future<DogList?> call(final BreedEntity input) async {
    final dogs = await repository.getDogList(breed: input);
    return dogs;
  }
}