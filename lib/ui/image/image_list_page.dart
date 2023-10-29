import 'package:dog_breed/domain/domain.dart';
import 'package:dog_breed/ui/widgets/image_view.dart';
import 'package:flutter/material.dart';

import '../widgets/dog_scaffold.dart';

class DogImageListPage extends StatefulWidget {
  static const path = 'dashboard/dog/list';
  static const keyTitle = 'title';
  static const keyData = 'dogData';
  final DogData<List<String>> dogData;
  final String title;

  const DogImageListPage({
    super.key,
    required this.dogData,
    required this.title,
  });

  @override
  State<StatefulWidget> createState() {
    return _ImageListState();
  }
}

class _ImageListState extends State<DogImageListPage> {
  List<String> get _dogs => widget.dogData.dogs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DogScaffold(
      title: widget.title,
      body: ListView.builder(
        itemBuilder: _buildDogList,
        itemCount: _dogs.length,
      ),
    );
  }

  Widget _buildDogList(BuildContext context, int index) {
    final double dimension = MediaQuery.of(context).size.width / 2 - 48;

    final dogImagePath = _dogs[index];
    return Material(

      child: Ink(
        child: InkWell(
          child: NetworkDogImage(
            fixedWidth: dimension - 12,
            imageUrl: dogImagePath,
          ),
        ),
      ),
    );
  }
}
