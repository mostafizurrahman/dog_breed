import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import 'action_type.dart';
import '../breed_dashboard/bloc/base_equatable.dart';
import '../breed_dashboard/bloc/dashboard_bloc.dart';
import 'theme_provider.dart';

class BottomModalView extends StatefulWidget {
  final BreedEntity data;
  const BottomModalView({
    super.key,
    required this.data,
  });

  @override
  State<StatefulWidget> createState() {
    return _BottomModalState();
  }
}

class _BottomModalState extends State<BottomModalView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getModalTitleRow(),
        const Divider(
          height: 0,
          thickness: 1.2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Column(
            children: _getActionButton(),
          ),
        ),
      ],
    );
  }

  List<Widget> _getActionButton() {
    final List<Widget> widgets = [];
    final actions = ActionValues.actions(widget.data);
    for (final type in actions) {
      final actionView = _getActionView(type);
      final view = _getInkButton(actionView, type);
      widgets.add(view);
    }
    return widgets;
  }

  Widget _getActionView(final ActionType type) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: ThemeProvider.shadow,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('${type.title} ${_getActionTitle(type).toUpperCase()}'),
            ),
          ),
          const Icon(
            Icons.navigate_next,
            color: Colors.blueAccent,
            size: 35,
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  String _getActionTitle(ActionType type) {
    if (widget.data.subBreed.isEmpty || !type.isSubBreed) {
      return widget.data.breed;
    }
    return '${widget.data.breed} -> ${widget.data.subBreed}';
  }

  Widget _getModalTitleRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Text(
            'Please Select!',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapDogData(final ActionType actionType) {
    final bloc = BlocProvider.of<DashboardBloc>(context);
    final event = _getEventFor(actionType: actionType);
    bloc.add(event);
    Navigator.of(context).pop();
  }

  DashboardEvent _getEventFor({required ActionType actionType}) {
    BreedEntity entity = widget.data;
    if (actionType == ActionType.randomImageBreed ||
        actionType == ActionType.imageListOfBreed) {
      entity = BreedEntity(breed: widget.data.breed, subBreed: '');
    }
    if (actionType == ActionType.imageListOfBreed ||
        actionType == ActionType.imageListOfBreedAndSubBreed) {
      return GetDogImageList(breedEntity: entity);
    }
    return GetRandomDogImage(breedEntity: entity);
  }

  Widget _getInkButton(final Widget content, final ActionType action) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      child: Material(
        color: Colors.white,
        child: Ink(
          height: 60,
          width: width,
          child: InkWell(
            onTap: () => _onTapDogData(action),
            child: content,
          ),
        ),
      ),
    );
  }
}
