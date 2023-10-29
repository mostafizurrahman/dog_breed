import 'package:dog_breed/ui/image/image_list_page.dart';
import 'package:flutter/material.dart';

import 'ui/breed_dashboard/breed_dashboard_page.dart';
import 'ui/image/random_image_page.dart';

void main() {
  runApp(const DogBreedApp());
}

class DogBreedApp extends StatelessWidget {
  const DogBreedApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BreedDashboardPage(),
      onGenerateRoute: _onGenerateRoute,
    );
  }
  MaterialPageRoute _onGenerateRoute(RouteSettings settings) {
    Widget routeWidget = const SizedBox();
    if (settings.name == BreedDashboardPage.path) {
      routeWidget = const BreedDashboardPage();
    } else if (settings.name == DogImageListPage.path) {
      final args = (settings.arguments as Map<String, dynamic>?);
      assert(args != null, 'Map arguments not provided for list image page');
      final dogData = args![DogImageListPage.keyData];
      final String title = args[DogImageListPage.keyTitle];
      routeWidget = DogImageListPage(dogData: dogData, title: title);
    } else if (settings.name == DogRandomImagePage.path) {
      final args = (settings.arguments as Map<String, dynamic>?);
      assert(args != null, 'Map arguments not provided for Random image page');
      final path = args![DogRandomImagePage.path];
      final String title = args[DogImageListPage.keyTitle];
      routeWidget = DogRandomImagePage(imagePath: path, title: title);
    }
    return MaterialPageRoute(
      builder: (context) => routeWidget,
      settings: settings,
    );
  }

}
