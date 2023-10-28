import 'package:dog_breed/ui/widgets/image_view.dart';
import 'package:flutter/material.dart';

import '../widgets/theme_provider.dart';

class DogBreedView extends StatelessWidget {
  final String breedName;
  const DogBreedView({
    super.key,
    required this.breedName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 12, right: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: ThemeProvider.shadow,
        height: 90,
        child: Row(
          children: [
            const SizedBox(width: 16),
            const ImageView(),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                breedName.toUpperCase(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
