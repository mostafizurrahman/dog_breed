part of 'base_equatable.dart';

@immutable
abstract class DogBreedState extends Equatable {
  @override
  List<Object?> get props => [DateTime.now().millisecondsSinceEpoch];
}

class BreedListState extends _BreedEquatableState<Map<String, List<String>>> {
  const BreedListState({required super.dogData});

  @override
  String value({required Map<String, List<String>> data}) {
    return data.values.toSet().toString();
  }

  @override
  String toString() {
    return "BreedListState :: ${super.toString()}";
  }
}

class RandomDogImageState extends _BreedEquatableState<String> {
  const RandomDogImageState({required super.dogData});
  @override
  String value({required String data}) {
    return data;
  }

  @override
  String toString() {
    return "RandomDogImageState :: ${super.toString()}";
  }
}

class DogImageListState extends _BreedEquatableState<List<String>> {
  const DogImageListState({required super.dogData});
  @override
  String value({required List<String> data}) {
    return data.toSet().toString();
  }

  @override
  String toString() {
    return "DogImageListState :: ${super.toString()}";
  }
}
