import 'package:dog_breed/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bottom_sheet_dialog.dart';
import '../widgets/image_view.dart';
import '../widgets/theme_provider.dart';
import 'bloc/dashboard_bloc.dart';

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
    final bloc = BlocProvider.of<DashboardBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
      child: Container(
        height: 170,
        width: MediaQuery.of(context).size.width,
        decoration: ThemeProvider.shadow,
        child: Column(
          children: [
            _getBreedWidget(),
            const Divider(height: 1.5),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return _getSubBreedView(
                    bloc,
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

  Widget _getSubBreedView(
    final DashboardBloc bloc,
    BuildContext context,
    final String subBreed,
  ) {
    const String path =
        "https://img.lovepik.com/element/45007/1548.png_300.png";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 3 - 48,
        height: 100,
        decoration: ThemeProvider.shadow,
        child: Ink(
          child: InkWell(
            onTap: () => _onTapSubBreed(context, subBreed, bloc),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ImageView(imageUrl: path, dimension: 30),

                Text(
                  subBreed,
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubBreed(
    BuildContext context,
    final String subBreed,
    final DashboardBloc bloc,
  ) {
    final dog = BreedEntity(breed: breed, subBreed: subBreed);
    showModalBottomSheet(
      context: context,
      builder: (final BuildContext ctx) {
        return BlocProvider.value(
          value: bloc,
          child: BottomModalView(
            data: dog,
          ),
        );
      },
    );
  }

  Widget _getBreedWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(width: 16),
        const Expanded(
          child: Text(
            'Sub-breed:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const ImageView(dimension: 35),
              Text(
                breed.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blueAccent,
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
