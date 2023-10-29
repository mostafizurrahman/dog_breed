import 'package:dog_breed/domain/domain.dart';
import 'package:dog_breed/ui/breed_dashboard/bloc/dashboard_bloc.dart';
import 'package:dog_breed/ui/widgets/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bottom_sheet_dialog.dart';
import '../widgets/theme_provider.dart';

class DogBreedView extends StatelessWidget {
  final BreedEntity dogBreed;
  const DogBreedView({
    super.key,
    required this.dogBreed,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<DashboardBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 12, right: 12),
      child: Container(
        decoration: ThemeProvider.shadow,
        height: 90,
        child: Ink(
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (final BuildContext ctx) {
                  return _getDialogueBody(bloc);
                },
              );
            },
            child: Row(
              children: [
                const SizedBox(width: 16),
                const ImageView(),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    dogBreed.breed.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getDialogueBody(DashboardBloc bloc) {
    return BlocProvider.value(
      value: bloc,
      child: BottomModalView(
        data: dogBreed,
      ),
    );
  }
}
