import 'package:flutter/material.dart';

import 'ui/breed_dashboard/breed_dashboard_page.dart';

void main() {
  runApp(const DogBreedApp());
}

class DogBreedApp extends StatelessWidget {
  const DogBreedApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BreedDashboardPage(),
    );
  }
}
