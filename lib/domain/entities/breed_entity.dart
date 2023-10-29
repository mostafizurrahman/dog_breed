import 'package:dog_breed/ui/widgets/action_type.dart';

class BreedEntity {
  final String breed;
  final String subBreed;
  const BreedEntity({
    required this.breed,
    required this.subBreed,
  });

  factory BreedEntity.empty() {
    return const BreedEntity(breed: '', subBreed: '');
  }
}
