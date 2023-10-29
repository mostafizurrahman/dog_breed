import '../../domain/entities/breed_entity.dart';

enum ActionType {
  randomImageBreed,
  randomImageBreedAndSubBreed,
  imageListOfBreed,
  imageListOfBreedAndSubBreed,
}

extension ActionValues on ActionType {
  static List<ActionType> actions(final BreedEntity breed) {
    if (breed.subBreed.isEmpty) {
      return [ActionType.randomImageBreed, ActionType.imageListOfBreed];
    }
    return ActionType.values;
  }

  String get title {
    if (this == ActionType.imageListOfBreed) {
      return 'Breed Image List of : ';
    }
    if (this == ActionType.imageListOfBreedAndSubBreed) {
      return 'Sub-Breed Image List of : ';
    }
    if (this == ActionType.randomImageBreed) {
      return 'Random Image by Breed : ';
    }
    if (this == ActionType.randomImageBreedAndSubBreed) {
      return 'Random Image by Sub-Breed : ';
    }
    return '';
  }

  bool get isSubBreed => [
        ActionType.imageListOfBreedAndSubBreed,
        ActionType.randomImageBreedAndSubBreed,
      ].contains(this);
}
