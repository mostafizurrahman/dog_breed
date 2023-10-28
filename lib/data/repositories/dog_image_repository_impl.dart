import 'package:dog_breed/config/service_locator.dart';
import 'package:dog_breed/data/data.dart';

import '../../domain/domain.dart';

class DogImageRepositoryImpl implements DogBreedImageRepository {
  final _dataSource = imageService.get<ImageRemoteDataSource>();
  @override
  Future<BreedList?> getDogBreedList() async {
    final eitherData = await _dataSource.getBreadList();
    final data = eitherData.fold<DogData?>(_getBreedList, _onError);
    return data as BreedList?;
  }

  BreedList _getBreedList(final BreedListResponse response) {
    return response.toEntity();
  }

  DogData? _onError(final BaseErrorModel request) {
    return null;
  }

  @override
  Future<DogList?> getDogList({required BreedEntity breed}) async {
    final BaseRequest request = BaseRequest(
      breed: breed.breed,
      subBreed: breed.subBreed,
    );
    final eitherData = await _dataSource.getDogList(request: request);
    final data = eitherData.fold(_getDogList, _onError);
    return data as DogList?;
  }

  DogList _getDogList(final ImageListResponse response) {
    return response.toEntity();
  }

  @override
  Future<DogImage?> getRandomDogImage({required BreedEntity breed}) async {
    final BaseRequest request = BaseRequest(
      breed: breed.breed,
      subBreed: breed.subBreed,
    );
    final eitherData = await _dataSource.getRandomImage(request: request);
    final data = eitherData.fold(_getDogImage, _onError);
    return data as DogImage?;
  }

  DogImage _getDogImage(final RandomImageResponse response) {
    return response.toEntity();
  }
}
