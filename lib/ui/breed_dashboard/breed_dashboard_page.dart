import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/service_locator.dart';
import '../../domain/domain.dart';
import '../widgets/dog_scaffold.dart';
import 'bloc/base_equatable.dart';
import 'bloc/dashboard_bloc.dart';
import 'breed_list_view.dart';

class BreedDashboardPage extends StatefulWidget {
  static const String path = 'breed/dashboard';

  const BreedDashboardPage({super.key});
  @override
  State<StatefulWidget> createState() => _BreedDashboardState();
}

class _BreedDashboardState extends State<BreedDashboardPage> {
  final _dashboardBloc = DashboardBloc();
  final _notifier = StreamController<NetworkEntity>();
  late final StreamSubscription<NetworkEntity> _apiSubscriber;

  @override
  void initState() {
    super.initState();
    _initStateData();
  }

  void _initStateData() {
    _apiSubscriber = _notifier.stream.listen(_onApiStatus);
    initImageService(notifier: _notifier)
        .then(_onInitService)
        .onError(_onErrorInit);
  }

  void _onInitService(_) {
    _dashboardBloc.add(GetDogBreedList());
  }

  void _onErrorInit(final error, final stack) {}

  void _onApiStatus(NetworkEntity networkEntity) {}

  @override
  Widget build(BuildContext context) {
    return DogScaffold(
      body:  _getBody(),
    );
  }

  Widget _getBody() {
    return BlocBuilder(
      builder: _onDashboardStateChanged,
      bloc: _dashboardBloc,
    );
  }

  Widget _onDashboardStateChanged(
    final BuildContext ctx,
    DashboardState state,
  ) {
    if (state is DashboardLoadingState) {
      return _getLoadingView();
    }

    if (state is BreedListState) {
      return BlocProvider.value(
        value: _dashboardBloc,
        child: BreedListView(breedList: state.dogData as BreedList),
      );
    }

    return const SizedBox();
  }

  Widget _getLoadingView() {
    return Center(
      child: Column(
        children: const [
          Text('Loading Dashboard'),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _dashboardBloc.close();
    _apiSubscriber.cancel();
    super.dispose();
  }
}
