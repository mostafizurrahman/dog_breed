import 'package:flutter/material.dart';

import '../widgets/image_view.dart';
import '../widgets/theme_provider.dart';

class SubBreedView extends StatelessWidget {
  final String breed;
  final List<String> subBreeds;

  const SubBreedView({
    super.key,
    required this.breed,
    required this.subBreeds,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        height: 165,
        width: MediaQuery.of(context).size.width,
        decoration: ThemeProvider.shadow,
        child: Column(
          children: [
            _getBreedWidget(),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return _getSubBreedView(
                    context,
                    subBreeds[index],
                  );
                },
                itemCount: subBreeds.length,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _getSubBreedView(BuildContext context, final String subBreed) {
    const String path = "https://scalebranding.com/wp-content/uploads/2022/01/Cat-Dog-300x300.jpg";;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 3 - 48,
        height: 95,
        decoration: ThemeProvider.shadow,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImageView(imageUrl: path, dimension: 35),
            Text(
              subBreed,
              style: const TextStyle(color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
    ;
  }

  Widget _getBreedWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const ImageView(dimension: 35),
              Text(
                breed,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
