import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../domain/domain.dart';
import 'base_equatable.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardLoadingState()) {
    on<GetDogBreedList>(_getBreedList);
    on<GetDogImageList>(_getDogImageList);
    on<GetRandomDogImage>(_getRandomDogImage);
  }

  Future<void> _getBreedList(
    final GetDogBreedList event,
    final Emitter<DashboardState> emitter,
  ) async {
    final breedListUseCase = BreedListUsecase();
    final breeds = await breedListUseCase.call(BreedEntity.empty());
    if (breeds != null) {
      final breedsState = BreedListState(dogData: breeds);
      emitter(breedsState);
    } else {
      emitter(const DashboardErrorState());
    }
  }

  Future<void> _getRandomDogImage(
    final GetRandomDogImage event,
    final Emitter<DashboardState> emitter,
  ) async {
    final randomDogImage = RandomDogImageUsecase();
    final dog = await randomDogImage.call(event.breedEntity);
    if (dog != null) {
      final breedsState = RandomDogImageState(dogData: dog);
      emitter(breedsState);
    } else {
      emitter(const DashboardErrorState());
    }
  }

  Future<void> _getDogImageList(
    final GetDogImageList event,
    final Emitter<DashboardState> emitter,
  ) async {
    final dogImageList = DogImageListUsecase();
    final dogs = await dogImageList.call(event.breedEntity);
    if (dogs != null) {
      final breedsState = DogImageListState(dogData: dogs);
      emitter(breedsState);
    } else {
      emitter(const DashboardErrorState());
    }
  }
}
