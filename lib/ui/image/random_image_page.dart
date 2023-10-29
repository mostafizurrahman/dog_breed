import 'package:dog_breed/domain/domain.dart';
import 'package:dog_breed/ui/widgets/image_view.dart';
import 'package:dog_breed/ui/widgets/theme_provider.dart';

import 'package:flutter/material.dart';

import '../widgets/dog_scaffold.dart';

class DogRandomImagePage extends StatefulWidget {
  static const path = 'dashboard/random/dog/image';
  static const keyTitle = 'title';
  static const keyPath = 'imagePath';
  final String imagePath;
  final String title;

  const DogRandomImagePage({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  State<StatefulWidget> createState() {
    return _ImageListState();
  }
}

class _ImageListState extends State<DogRandomImagePage> {
  late final double dimension;
  @override
  void initState() {
    super.initState();
    dimension = MediaQuery.of(context).size.width - 48;
  }

  @override
  Widget build(BuildContext context) {
    return DogScaffold(
      title: widget.title,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 120,
        decoration: ThemeProvider.shadow,
        child: ImageView(
          imageUrl: widget.imagePath,
          dimension: dimension,
        ),
      ),
    );
  }
}
