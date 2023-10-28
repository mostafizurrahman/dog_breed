import '../domain.dart';

class BreedListUsecase extends BaseUseCase<BreedList?, BreedEntity> {
  BreedListUsecase();

  @override
  Future<BreedList?> call(final BreedEntity input) async {
    final breeds = await repository.getDogBreedList();
    return breeds;
  }
}
