import 'package:dog_breed/ui/widgets/image_view.dart';
import 'package:dog_breed/ui/widgets/theme_provider.dart';
import 'package:flutter/material.dart';
import '../../domain/domain.dart';
import 'dog_breed_view.dart';
import 'sub_breed_view.dart';

class BreedListView extends StatefulWidget {
  final BreedList breedList;
  const BreedListView({
    super.key,
    required this.breedList,
  });

  @override
  State<StatefulWidget> createState() {
    return _BreedListState();
  }
}

class _BreedListState extends State<BreedListView> {
  Map<String, List<String>> get dogs => widget.breedList.dogs;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: _getDogBreeds(),
      ),
    );
  }

  List<Widget> _getDogBreeds() {
    final List<Widget> widgets = [const SizedBox(height: 8)];
    for (final dog in dogs.entries) {
      if (dog.value.isEmpty) {
        final breed = BreedEntity(breed: dog.key, subBreed: '');
        widgets.add(DogBreedView(dogBreed: breed));
      } else {
        widgets.add(_getBreedRow(dog.key, dog.value));
      }
    }

    return widgets;
  }

  Widget _getBreedRow(final String breedName, final List<String> subBreeds) {
    return SubBreedView(breed: breedName, subBreeds: subBreeds);
  }
}
