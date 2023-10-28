import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/domain.dart';
import '../widgets/dog_scaffold.dart';
import 'bloc/dashboard_bloc.dart';

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
    _apiSubscriber = _notifier.stream.listen(_onApiStatus);
  }

  void _onApiStatus(NetworkEntity networkEntity) {}

  @override
  Widget build(BuildContext context) {
    return DogScaffold(
      body: BlocProvider.value(
        value: _dashboardBloc,
        child: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return Container();
  }

  @override
  void dispose() {
    _dashboardBloc.close();
    _apiSubscriber.cancel();
    super.dispose();
  }
}
