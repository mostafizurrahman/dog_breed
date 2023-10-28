part of 'base_equatable.dart';


class GetDogBreedList extends DashboardEvent {}

class GetDogImageList extends _BreedEquatableEvent {
  const GetDogImageList({required super.breedEntity});
}

class GetRandomDogImage extends _BreedEquatableEvent {
  const GetRandomDogImage({required super.breedEntity});
}
