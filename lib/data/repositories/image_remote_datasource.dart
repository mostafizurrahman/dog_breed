import 'package:dartz/dartz.dart';
import '../data.dart';


abstract class ImageRemoteDataSource {
  Future<Either<BreedListResponse, BaseErrorModel>> getBreadList();

  Future<Either<RandomImageResponse, BaseErrorModel>> getRandomImage({
    required final BaseRequest request,
  });
  Future<Either<ImageListResponse, BaseErrorModel>> getDogList({
    required final BaseRequest request,
  });
}

class ImageRemoteDataSourceImpl implements ImageRemoteDataSource {
  final _breedListApi = BreedListApi();

  @override
  Future<Either<BreedListResponse, BaseErrorModel>> getBreadList() async {
    return await _breedListApi.get();
  }

  @override
  Future<Either<ImageListResponse, BaseErrorModel>> getDogList({
    required final BaseRequest request,
  }) async {
    final path = request.subBreed.isEmpty
        ? ApiEndPoint.dogListByBreed
        : ApiEndPoint.dogListBySubBreed;
    final String endPoint = _getDynamicEndPoint(
      request: request,
      templatedEndPoint: path,
    );
    final listApi = DogImageListApi(endPoint: endPoint);
    return await listApi.get();
  }

  String _getDynamicEndPoint({
    required final BaseRequest request,
    required final String templatedEndPoint,
  }) {
    String endPoint = templatedEndPoint.replaceAll(
      ApiEndPoint.keyBreedName,
      request.breed,
    );
    if (request.subBreed.isNotEmpty) {
      endPoint = endPoint.replaceAll(
        ApiEndPoint.keySubBreedName,
        request.subBreed,
      );
    }
    return endPoint;
  }

  @override
  Future<Either<RandomImageResponse, BaseErrorModel>> getRandomImage({
    required final BaseRequest request,
  }) async {
    final path = request.subBreed.isEmpty
        ? ApiEndPoint.randomDogImageBreed
        : ApiEndPoint.randomDogImageSubBreed;
    final String endPoint = _getDynamicEndPoint(
      request: request,
      templatedEndPoint: path,
    );
    final randomImageApi = RandomDogImageApi(endPoint: endPoint);
    return await randomImageApi.get();
  }
}
